
using CephasPAD.JXOnlineWeb.Models;
using CephasPAD.JXOnlineWeb.Services;
using JXOnline.WebApp.Models;
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
        this.gameServiceProcesses = await serverManagerService.ListProcessesAsync();
        this.isChecking = false;
        await InvokeAsync(StateHasChanged);
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
        this.isWorking = true;
        try
        {
            var processStartInfo = new ProcessStartInfo
            {
                FileName = gameServiceProcess.Info.FileName,
                Arguments = gameServiceProcess.Info.Arguments,
                WorkingDirectory = gameServiceProcess.Info.WorkingDirectory,
            };
            Process.Start(processStartInfo);
            await Task.Delay(1000);
        }
        catch (Exception ex)
        {
            await Notify.Error(ex.Message, $"Start {gameServiceProcess.Info.Name} failed !!!");
        }
        finally
        {
            this.isWorking = false;
        }
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
