using Volo.Abp.DependencyInjection;
using Volo.Abp.Ui.Branding;

namespace CephasPAD.JXOnlineWeb;

[Dependency(ReplaceServices = true)]
public class JXOnlineWebBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "JXOnlineWeb";
}
