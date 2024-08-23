using System.Collections.ObjectModel;
using Volo.Abp.DependencyInjection;

namespace CephasPAD.JXOnlineWeb.Services;

public interface IProcessMapService : ISingletonDependency
{
    Task<ReadOnlyDictionary<string, int?>> GetAsync();
    Task SetValueAsync(string key, int? value);
    Task<int?> GetValueOrNullAsync(string key);
}
