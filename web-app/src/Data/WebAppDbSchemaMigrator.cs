using Volo.Abp.DependencyInjection;
using Microsoft.EntityFrameworkCore;

namespace JXOnline.WebApp.Data;

public class WebAppDbSchemaMigrator : ITransientDependency
{
    private readonly IServiceProvider _serviceProvider;

    public WebAppDbSchemaMigrator(
        IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
    }

    public async Task MigrateAsync()
    {
        
        /* We intentionally resolving the WebAppDbContext
         * from IServiceProvider (instead of directly injecting it)
         * to properly get the connection string of the current tenant in the
         * current scope.
         */

        await _serviceProvider
            .GetRequiredService<WebAppDbContext>()
            .Database
            .MigrateAsync();

    }
}
