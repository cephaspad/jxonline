
using CephasPAD.JXOnlineWeb.Models;
using CephasPAD.JXOnlineWeb.Services;
using Microsoft.AspNetCore.Identity;
using System.Diagnostics;

namespace CephasPAD.JXOnlineWeb.Components.Pages;

public partial class Index
{
    private readonly Timer timer;
    private readonly IServerManagerService serverManagerService;
    private IEnumerable<GameServiceProcess> gameServiceProcesses;
    private bool isChecking;
    private bool isWorking;
    private DateTime lastChecked = DateTime.MinValue;

    public Index(IServerManagerService serverManagerService)
    {
        this.timer = new Timer(async _ => await AutoCheckAsync(), null, Timeout.Infinite, Timeout.Infinite);
        this.gameServiceProcesses = [];
        this.isChecking = false;
        this.serverManagerService = serverManagerService;
    }

    protected override void OnAfterRender(bool firstRender)
    {
        if (firstRender)
        {
            this.timer.Change(TimeSpan.Zero, TimeSpan.FromSeconds(1));
        }
        base.OnAfterRender(firstRender);
    }

    private async Task AutoCheckAsync()
    {
        Logger.LogInformation("AutoCheckAsync");

        if (isChecking)
        {
            Logger.LogInformation("AutoCheckAsync is working");
            return;
        }
        this.isChecking = true;

        this.lastChecked = DateTime.Now;
        var processes = Process.GetProcesses();
        foreach (var gameServiceProcess in gameServiceProcesses)
        {
            try
            {
                var process = processes.FirstOrDefault(p => p.ProcessName == gameServiceProcess.Info.Name);
                if (process == null)
                {
                    gameServiceProcess.MarkAsRunning();
                    continue;
                }
                gameServiceProcess.MarkAsStopped();
            }
            catch (Exception ex)
            {
                Logger.LogError(ex, "AutoCheckAsync failed");
            }
        await InvokeAsync(StateHasChanged);
        
        this.isChecking = false;
    }

    protected override void Dispose(bool disposing)
    {
        this.timer.Dispose();
        base.Dispose(disposing);
    }

    protected async Task StartAllAsync()
    {
        if (isWorking)
        {
            return;
        }
        this.isWorking = true;
        await Task.Delay(1000);
        this.isWorking = false;
    }

    protected async Task StopAllAsync()
    {
        if (isWorking)
        {
            return;
        }
        this.isWorking = true;
        await Task.Delay(1000);
        this.isWorking = false;
    }

    protected async Task StartAsync(GameServiceProcess gameServiceProcess)
    {
        if (isWorking)
        {
            return;
        }
        this.isWorking = true;
        await Task.Delay(1000);
        this.isWorking = false;
    }

    protected async Task StopAsync(GameServiceProcess gameServiceProcess)
    {
        if (isWorking)
        {
            return;
        }
        this.isWorking = true;
        await Task.Delay(1000);
        this.isWorking = false;
    }
}
