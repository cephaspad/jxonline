using CephasPAD.JXOnlineWeb.Models;
using JXOnline.WebApp.Models;
using System.Diagnostics;

namespace CephasPAD.JXOnlineWeb.Services;

public class ServerManagerService : IServerManagerService
{
    public async Task<IEnumerable<GameServiceProcess>> ListAsync()
    {
        var gameServiceProcesses = new List<GameServiceProcess>();
        var gameServiceProcessInfos = GameServiceProcessInfo.LoadAll();
        var processes = Process.GetProcesses();
        foreach (var gameServiceProcessInfo in gameServiceProcessInfos)
        {
            var gameServiceProcess = new GameServiceProcess(gameServiceProcessInfo);
            gameServiceProcesses.Add(gameServiceProcess);
            if (processes.Any(p => p.ProcessName == gameServiceProcessInfo.Name))
            {
                gameServiceProcess.MarkAsRunning();
            }
            else
            {
                gameServiceProcess.MarkAsStopped();
            }
        }
        await Task.Delay(1);
        return gameServiceProcesses;
    }
}
