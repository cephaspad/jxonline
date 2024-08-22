using Volo.Abp.Application.Services;

namespace CephasPAD.JXOnlineWeb.Services
{
    public interface IUserAppService : IApplicationService
    {
        Task CreateAsync(string accName);
        Task DeleteAsync(string accName);
        Task DeleteCharacterAsync(int id);
    }
}
