using CephasPAD.JXOnlineWeb.Models;
using JXOnline.WebApp.Models;
using Volo.Abp.Application.Services;
using Volo.Abp.DependencyInjection;

namespace CephasPAD.JXOnlineWeb.Services;

public interface IServerManagerService : ITransientDependency
{
    Task<IEnumerable<GameServiceProcess>> ListProcessesAsync();
}
