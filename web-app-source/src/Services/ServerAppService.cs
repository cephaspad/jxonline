using CephasPAD.JXOnlineWeb.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Diagnostics;

namespace CephasPAD.JXOnlineWeb.Services;

public class ServerAppService(IProcessMapService processMapService) : IServerAppService
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
                return Process.GetProcessById(processId.Value);
            }
        }
        catch
        {
            
        }
        return null;
    }

    public IEnumerable<ServerAppInfo> ListAppInfos()
    {
        return
        [
            new("Sword3PaySys", "Sword3PaySys.exe", AccountServerRoot, true),
            new("S3RelayServer", "S3RelayServer.exe", AccountServerRoot, true),
            new("goddess_y", "goddess_y", GatewayRoot),
            new("bishop_y", "bishop_y", GatewayRoot),
            new("s3relay_y", "s3relay_y", S3RelayServerRoot),
            new("jx_linux_y", "jx_linux_y", GameServerRoot),
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
            FileName = serverAppInfo.Executable,
            WorkingDirectory = serverAppInfo.WorkingDirectory,
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };

        if (serverAppInfo.IsWine)
        {
            processStartInfo.FileName = "/usr/bin/wine";
            processStartInfo.Arguments = serverAppInfo.Executable;
        }

        process = Process.Start(processStartInfo)
            ?? throw new Exception("Failed to start process");
        
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