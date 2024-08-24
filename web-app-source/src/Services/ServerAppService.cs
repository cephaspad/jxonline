using CephasPAD.JXOnlineWeb.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Collections.Specialized;
using System.Diagnostics;

namespace CephasPAD.JXOnlineWeb.Services;

public class ServerAppService(IProcessMapService processMapService, ILogger logger) : IServerAppService
{
    private static string ServerRoot => "/jx";
    private static string AccountServerRoot => Path.Combine(ServerRoot, "paysyswin");
    private static string GatewayRoot => Path.Combine(ServerRoot, "gateway");
    private static string S3RelayServerRoot => Path.Combine(GatewayRoot, "s3relay");
    private static string GameServerRoot => Path.Combine(ServerRoot, "server1");

    private async Task<Process?> FindProcessAsync(ServerAppInfo serverAppInfo)
    {
        try
        {
            var processMap = await processMapService.GetAsync();
            if (processMap.TryGetValue(serverAppInfo.Name, out int? processId) && processId != null)
            {
                var process = Process.GetProcessById(processId.Value);
                if (process.ProcessName == serverAppInfo.Executable)
                {
                    return process;
                }
            }
        }
        catch
        {
        }
        return null;
    }

    public IEnumerable<ServerAppInfo> ListAppInfos()
    {
        Dictionary<string, string?> wineEnv = new()
        {
            ["WINEARCH"] = "win32",
            ["WINEPREFIX"] = "/root/.win32",
            ["DISPLAY"] = ":0",
            ["GNUTLS_SYSTEM_PRIORITY_FILE"] = Path.GetFullPath("priorityGNU")
        };

        return
        [
            new("virtual-display-server", "Xvfb", "/usr/bin"),
            new("relay-server", "S3RelayServer.exe", AccountServerRoot, environment: wineEnv, isWine: true),
            new("pay-server", "Sword3PaySys.exe", AccountServerRoot, environment:wineEnv, isWine: true),
            new("database-server", "goddess_y", GatewayRoot),
            new("pay-client", "bishop_y", GatewayRoot),
            new("relay-client", "s3relay_y", S3RelayServerRoot),
            new("game-server", "jx_linux_y", GameServerRoot),
        ];
    }

    public async Task<IEnumerable<ServerAppProcess>> ListProcessesAsync()
    {
        var serverAppInfos = ListAppInfos();
        var serverAppProcesses = new List<ServerAppProcess>();
        foreach (var serverAppInfo in serverAppInfos)
        {
            var processMap = await processMapService.GetAsync();
            if (!processMap.TryGetValue(serverAppInfo.Name, out int? processId))
            {
                await processMapService.SetValueAsync(serverAppInfo.Name, null);
            }

            var serverAppProcess = new ServerAppProcess(serverAppInfo);
            if (processId == null)
            {
                serverAppProcesses.Add(serverAppProcess);
                continue;
            }

            try
            {
                var serverAppSystemProcess = Process.GetProcessById(processId.Value);
                serverAppProcess.UpdateStatus(ServerAppStatus.Running);
            }
            catch
            {
            }

            serverAppProcesses.Add(serverAppProcess);
        }
        return await Task.FromResult(serverAppProcesses);
    }

    public async Task StartAsync(ServerAppInfo serverAppInfo)
    {
        var process = await FindProcessAsync(serverAppInfo);

        if (process != null)
        {
            throw new InvalidOperationException("Process already running");
        }

        var processStartInfo = new ProcessStartInfo
        {
            FileName = Path.Combine(serverAppInfo.WorkingDirectory, serverAppInfo.Executable),
            WorkingDirectory = serverAppInfo.WorkingDirectory,
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true,
        };
        processStartInfo.Environment.Clear();
        foreach (var (key, value) in serverAppInfo.Environment)
        {
            processStartInfo.Environment[key] = value;
        }

        if (serverAppInfo.IsWine)
        {
            processStartInfo.FileName = "/usr/bin/wine";
            processStartInfo.Arguments = Path.Combine(serverAppInfo.WorkingDirectory, serverAppInfo.Executable);
        }

        process = Process.Start(processStartInfo)
            ?? throw new Exception("Failed to start process");

        process.OutputDataReceived += (sender, e) =>
        {
            if (e.Data != null)
            {
                logger.LogInformation(message: e.Data);
            }
        };

        await processMapService.SetValueAsync(serverAppInfo.Name, process.Id);
    }

    public async Task StopAsync(ServerAppInfo serverAppInfo)
    {
        var process = await FindProcessAsync(serverAppInfo);
        if (process != null)
        {
            process.Kill();
            await processMapService.SetValueAsync(serverAppInfo.Name, null);
        }
    }
}