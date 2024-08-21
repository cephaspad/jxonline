using JXOnline.WebApp.Models;
using JXOnline.WebApp.Services;
using JXOnline.WebApp.ViewModels;

namespace JXOnline.WebApp.Components.Pages
{
    public partial class Home : IDisposable
	{
        private readonly ManagementService managementService;
        private readonly IEnumerable<GameServiceProcessViewModel> gameServices;
        private readonly IDictionary<GameServiceProcessViewModel, bool> isProcessStarting;
        private readonly IDictionary<GameServiceProcessViewModel, bool> isProcessStopping;
        private readonly PeriodicTimer timer;
        private readonly CancellationTokenSource cancellationTokenSource;

        public Home()
		{
			this.gameServices = GameServiceProcessInfo.LoadAll().Select(gameServiceProcessInfo => new GameServiceProcessViewModel(gameServiceProcessInfo));
            this.isProcessStarting = gameServices.ToDictionary(key => key, value => false);
            this.isProcessStopping = gameServices.ToDictionary(key => key, value => false);
            this.managementService = new ManagementService();
            this.timer = new PeriodicTimer(TimeSpan.FromSeconds(1));
            this.cancellationTokenSource = new CancellationTokenSource();
        }

        protected override async Task OnAfterRenderAsync(bool firstRender)
        {
            if (firstRender)
            {
                await AutoCheckAsync();
            }

            await base.OnAfterRenderAsync(firstRender);
        }

        public void Dispose()
        {
            this.cancellationTokenSource.Cancel();
            this.cancellationTokenSource.Dispose();
            GC.SuppressFinalize(this);
        }

        private async Task AutoCheckAsync()
		{
            while (await timer.WaitForNextTickAsync(cancellationTokenSource.Token))
            {
                foreach (var gameService in gameServices)
                {
                    var isProcessRunning = await managementService.CheckProcessForRunningAsync(gameService.Info);
                    if (isProcessStarting[gameService])
                    {
                        gameService.Status = GameServiceProcessStatus.Starting;
                    }
                    else if (isProcessStopping[gameService])
                    {
                        gameService.Status = GameServiceProcessStatus.Stopping;
                    }
                    else if (isProcessRunning)
                    {
                        gameService.Status = GameServiceProcessStatus.Running;
                    }
                    else
                    {
                        gameService.Status = GameServiceProcessStatus.Stopped;
                    }
                }
                await InvokeAsync(StateHasChanged);
            }
        }
    }
}