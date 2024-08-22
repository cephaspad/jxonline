using CephasPAD.JXOnlineWeb.Models;
using Volo.Abp.Application.Services;
using Volo.Abp.DependencyInjection;

namespace CephasPAD.JXOnlineWeb.Services;

public interface IServerAppService : ITransientDependency
{
    Task<IEnumerable<ServerAppProcess>> ListProcessesAsync();
    Task StartAsync(ServerAppInfo serverAppInfo);
    Task StopAsync(ServerAppInfo serverAppInfo);
    Task UnregisterAsync(string serverName);
}
