using CephasPAD.JXOnlineWeb.Localization;
using Volo.Abp.AspNetCore.Components;

namespace CephasPAD.JXOnlineWeb;

public abstract class JXOnlineWebComponentBase : AbpComponentBase
{
    protected JXOnlineWebComponentBase()
    {
        LocalizationResource = typeof(JXOnlineWebResource);
    }
}
