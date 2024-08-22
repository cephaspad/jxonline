using CephasPAD.JXOnlineWeb.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Diagnostics;

namespace CephasPAD.JXOnlineWeb.Services;

public class ServerAppService : IServerAppService
{
    public async Task<IEnumerable<ServerAppInfo>> ListAppsAsync()
    {
        var serviceDirectory = Path.GetFullPath("ServiceFiles");
        var serviceFiles = Directory.GetFiles(serviceDirectory);
        var serverAppInfos = new List<ServerAppInfo>();
        foreach (var serviceFile in serviceFiles)
        {
            var serverAppFileName = Path.GetFileName(serviceFile);
            var serverAppFullPath = Path.Combine(serviceDirectory, serverAppFileName);
            var serverAppInfo = new ServerAppInfo(serverAppFileName, serverAppFullPath);
            serverAppInfos.Add(serverAppInfo);
        }
        return await Task.FromResult(serverAppInfos);
    }

    public async Task<IEnumerable<ServerAppProcess>> ListProcessesAsync()
    {
        var serverAppInfos = await ListAppsAsync();
        var serverAppProcesses = new List<ServerAppProcess>();
        foreach (var serverAppInfo in serverAppInfos)
        {
            var serverAppProcess = new ServerAppProcess(serverAppInfo);
            serverAppProcess.UpdateStatus(await GetStatusAsync(serverAppInfo.Name));
            serverAppProcesses.Add(serverAppProcess);
        }
        return serverAppProcesses;
    }

    public async Task RegisterAsync(ServerAppInfo serverAppInfo)
    {
        var serviceFullName = Path.Combine(Path.GetFullPath("ServiceFiles"), $"{serverAppInfo.Name}");
        var processInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/sudo",
            Arguments = $"/usr/bin/systemctl link {serviceFullName}",
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        var process = Process.Start(processInfo)
            ?? throw new Exception("Failed to link process");
        await process.WaitForExitAsync();

        var output = process.StandardOutput.ReadToEnd();
        if (output.Contains("Interactive authentication required"))
        {
            throw new InvalidOperationException("Interactive authentication required");
        }
    }

    public async Task UnregisterAsync(string serviceName)
    {
        var processInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/sudo",
            Arguments = $"/usr/bin/systemctl disable {serviceName}",
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        var process = Process.Start(processInfo)
            ?? throw new Exception("Failed to unlink process");
        await process.WaitForExitAsync();

        var output = process.StandardOutput.ReadToEnd();
        if (output.Contains("Interactive authentication required"))
        {
            throw new InvalidOperationException("Interactive authentication required");
        }
    }

    public async Task StartAsync(ServerAppInfo serverAppInfo)
    {
        var serviceName = serverAppInfo.Name;
        if (!HasBeenRegistered(serviceName))
        {
            await RegisterAsync(serverAppInfo);
        }

        if (await GetStatusAsync(serviceName) == ServerAppStatus.Active)
        {
            throw new InvalidOperationException("Service has been activated");
        }

        var processInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/sudo",
            Arguments = $"/usr/bin/systemctl start {serviceName}",
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        var process = Process.Start(processInfo)
            ?? throw new Exception("Failed to start process");
        await process.WaitForExitAsync();
        var output = process.StandardOutput.ReadToEnd();
        if (output.Contains("Interactive authentication required"))
        {
            throw new InvalidOperationException("Interactive authentication required");
        }
    }

    public async Task StopAsync(ServerAppInfo serverAppInfo)
    {
        var serviceName = serverAppInfo.Name;
        if (!HasBeenRegistered(serviceName))
        {
            throw new InvalidOperationException("Service not found");
        }
        var processInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/sudo",
            Arguments = $"/usr/bin/systemctl stop {serviceName}",
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        var process = Process.Start(processInfo)
            ?? throw new Exception("Failed to stop process");
        await process.WaitForExitAsync();
        var output = process.StandardOutput.ReadToEnd();
        if (output.Contains("Interactive authentication required"))
        {
            throw new InvalidOperationException("Interactive authentication required");
        }
    }

    public bool HasBeenRegistered(string serviceName)
    {
        var servicePath = $"/etc/systemd/system/{serviceName}";
        return File.Exists(servicePath);
    }

    public async Task<ServerAppStatus> GetStatusAsync(string serviceName)
    {
        if (!HasBeenRegistered(serviceName))
        {
            return ServerAppStatus.NotRegistered;
        }

        var processInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/sudo",
            Arguments = $"/usr/bin/systemctl status {serviceName}",
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        var process = Process.Start(processInfo) 
            ?? throw new Exception("Failed to get status process");
        await process.WaitForExitAsync();
        var output = process.StandardOutput.ReadToEnd();

        if (output.Contains("Active: active"))
        {
            return ServerAppStatus.Active;
        }

        if (output.Contains("Active: inactive"))
        {
            return ServerAppStatus.Inactive;
        }

        if (output.Contains("Active: failed"))
        {
            return ServerAppStatus.Failed;
        }

        if (output.Contains("Active: activating"))
        {
            return ServerAppStatus.Activating;
        }

        if (output.Contains("Active: deactivating"))
        {
            return ServerAppStatus.Deactivating;
        }

        if (output.Contains("could not be found"))
        {
            return ServerAppStatus.NotRegistered;
        }

        return ServerAppStatus.Unknown;
    }
}