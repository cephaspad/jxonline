using JXOnline.WebApp.Localization;
using Volo.Abp.AspNetCore.Components;

namespace JXOnline.WebApp;

public abstract class WebAppComponentBase : AbpComponentBase
{
    protected WebAppComponentBase()
    {
        LocalizationResource = typeof(WebAppResource);
    }
}
