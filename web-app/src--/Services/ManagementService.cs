using JXOnline.WebApp.Models;
using System.Diagnostics;

namespace JXOnline.WebApp.Services
{
    public class ManagementService
    {
        public Task<bool> CheckProcessForRunningAsync(GameServiceProcessInfo gameProcessInfo)
        {
            var processes = Process.GetProcesses();
            return Task.FromResult(false);
        }
    }
}
