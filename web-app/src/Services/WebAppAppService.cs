using Volo.Abp.Application.Services;
using JXOnline.WebApp.Localization;

namespace JXOnline.WebApp.Services;

/* Inherit your application services from this class. */
public abstract class WebAppAppService : ApplicationService
{
    protected WebAppAppService()
    {
        LocalizationResource = typeof(WebAppResource);
    }
}