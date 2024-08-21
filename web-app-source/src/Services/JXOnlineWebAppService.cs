using CephasPAD.JXOnlineWeb.Localization;
using Volo.Abp.Application.Services;

namespace CephasPAD.JXOnlineWeb.Services;

/* Inherit your application services from this class. */
public abstract class JXOnlineWebAppService : ApplicationService
{
    protected JXOnlineWebAppService()
    {
        LocalizationResource = typeof(JXOnlineWebResource);
    }
}