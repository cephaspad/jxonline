using Microsoft.EntityFrameworkCore;
using Volo.Abp.DependencyInjection;

namespace CephasPAD.JXOnlineWeb.Data;

public class JXOnlineWebEFCoreDbSchemaMigrator : ITransientDependency
{
    private readonly IServiceProvider _serviceProvider;

    public JXOnlineWebEFCoreDbSchemaMigrator(
        IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task MigrateAsync()
    {
        /* We intentionally resolve the JXOnlineWebDbContext
         * from IServiceProvider (instead of directly injecting it)
         * to properly get the connection string of the current tenant in the
         * current scope.
         */

        await _serviceProvider
            .GetRequiredService<JXOnlineWebDbContext>()
            .Database
            .MigrateAsync();
    }
}
