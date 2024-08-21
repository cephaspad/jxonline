using CephasPAD.JXOnlineWeb.Models;
using JXOnline.WebApp.Models;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Diagnostics;

namespace CephasPAD.JXOnlineWeb.Services;

public class ServerManagerService : IServerManagerService
{
    public async Task<IEnumerable<GameServiceProcess>> ListProcessesAsync()
    {
        var processes = Process.GetProcesses();
        var gameServiceProcesses = GameServiceProcessInfo.LoadAll()
            .Select(info => new GameServiceProcess(info))
            .ToArray();
        foreach (var gameServiceProcess in gameServiceProcesses)
        {
            var processName = Path.GetFileName(gameServiceProcess.Info.FileName);
            var processesSameName = processes.Where(p => string.Compare(p.ProcessName, processName, true) == 0);
            foreach (var process in processesSameName)
            {
                var workingDirectory = await GetWorkingDirectoryAsync(process.Id);
                if (string.Compare(workingDirectory, gameServiceProcess.Info.WorkingDirectory) != 0)
                {
                    continue;
                }

                var execute = await GetExecuteAsync(process.Id);
                if (string.Compare(execute, gameServiceProcess.Info.FileName) != 0)
                {
                    continue;
                }

                var cmdLine = await GetCommandLineAsync(process.Id);
                if (cmdLine.Length <= execute.Length + 1)
                {
                    continue;
                }
                var arguments = cmdLine.Substring(execute.Length + 1);
                if (string.Compare(arguments, gameServiceProcess.Info.Arguments) != 0)
                {
                    continue;
                }

                gameServiceProcess.MarkAsRunning();
                break;
            }
        }

        return gameServiceProcesses;
    }
    public async Task<string> GetCommandLineAsync(int pid)
    {
        var process = Process.GetProcessById(pid) ?? throw new ArgumentException("Process not found", nameof(pid));
        var readCommandLineProcessInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/cat",
            Arguments = $"/proc/{process.Id}/cmdline",
            UseShellExecute = false,
            RedirectStandardOutput = true,
            CreateNoWindow = true
        };
        var readCommandLineProcess = Process.Start(readCommandLineProcessInfo) ?? throw new InvalidOperationException("Failed to start process"); await readCommandLineProcess.WaitForExitAsync();
        var output = readCommandLineProcess.StandardOutput.ReadToEnd();
        return output.TrimEnd('\0', '\n');
    }

    public async Task<string> GetWorkingDirectoryAsync(int pid)
    {
        var process = Process.GetProcessById(pid) ?? throw new ArgumentException("Process not found", nameof(pid));
        var readCommandLineProcessInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/readlink",
            Arguments = $"/proc/{process.Id}/cwd",
            UseShellExecute = false,
            RedirectStandardOutput = true,
            CreateNoWindow = true
        };
        var readCommandLineProcess = Process.Start(readCommandLineProcessInfo) ?? throw new InvalidOperationException("Failed to start process");
        await readCommandLineProcess.WaitForExitAsync();
        var output = readCommandLineProcess.StandardOutput.ReadToEnd();
        return output.TrimEnd('\0', '\n');
    }

    public async Task<string> GetExecuteAsync(int pid)
    {
        var process = Process.GetProcessById(pid) ?? throw new ArgumentException("Process not found", nameof(pid));
        var readCommandLineProcessInfo = new ProcessStartInfo
        {
            FileName = "/usr/bin/readlink",
            Arguments = $"/proc/{process.Id}/exe",
            UseShellExecute = false,
            RedirectStandardOutput = true,
            CreateNoWindow = true
        };
        var readCommandLineProcess = Process.Start(readCommandLineProcessInfo) ?? throw new InvalidOperationException("Failed to start process");
        await readCommandLineProcess.WaitForExitAsync();
        var output = readCommandLineProcess.StandardOutput.ReadToEnd();
        return output.TrimEnd('\0', '\n');
    }
}