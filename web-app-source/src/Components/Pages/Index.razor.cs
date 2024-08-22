
using CephasPAD.JXOnlineWeb.Models;
using CephasPAD.JXOnlineWeb.Services;

namespace CephasPAD.JXOnlineWeb.Components.Pages;

public partial class Index
{
    private readonly Timer timer;
    private readonly IServerAppService serverAppService;
    private IEnumerable<ServerAppProcess> serverAppProcesses;
    private bool isChecking;
    private bool isWorking;
    private DateTime lastChecked = DateTime.MinValue;

    public Index(IServerAppService serverAppService)
    {
        this.timer = new Timer(async _ => await AutoCheckAsync(), null, Timeout.Infinite, Timeout.Infinite);
        this.serverAppProcesses = [];
        this.isChecking = false;
        this.serverAppService = serverAppService;
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
        this.serverAppProcesses = await serverAppService.ListProcessesAsync();
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

    protected async Task StartAsync(ServerAppProcess serverAppProcess)
    {
        this.isWorking = true;
        try
        {
            await serverAppService.StartAsync(serverAppProcess.Info);
            await Notify.Success($"Start {serverAppProcess.Info.Name} success !!!");
        }
        catch (Exception ex)
        {
            await Notify.Error(ex.Message, $"Start {serverAppProcess.Info.Name} failed !!!");
        }
        finally
        {
            this.isWorking = false;
        }
    }

    protected async Task StopAsync(ServerAppProcess serverAppProcess)
    {
        this.isWorking = true;
        try
        {
            var serviceName = serverAppProcess.Info.Name;

            await serverAppService.StopAsync(serverAppProcess.Info);
            await serverAppService.UnregisterAsync(serviceName);
            await Notify.Success($"Stop {serverAppProcess.Info.Name} success !!!");
        }
        catch (Exception ex)
        {
            await Notify.Error(ex.Message, $"Stop {serverAppProcess.Info.Name} failed !!!");
        }
        finally
        {
            this.isWorking = false;
        }
    }
}
