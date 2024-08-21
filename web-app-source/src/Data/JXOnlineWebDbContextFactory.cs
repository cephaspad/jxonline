using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace CephasPAD.JXOnlineWeb.Data;

public class JXOnlineWebDbContextFactory : IDesignTimeDbContextFactory<JXOnlineWebDbContext>
{
    public JXOnlineWebDbContext CreateDbContext(string[] args)
    {

        var configuration = BuildConfiguration();

        var builder = new DbContextOptionsBuilder<JXOnlineWebDbContext>()
            .UseSqlite(configuration.GetConnectionString("Default"));

        return new JXOnlineWebDbContext(builder.Options);
    }

    private static IConfigurationRoot BuildConfiguration()
    {
        var builder = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json", optional: false);

        return builder.Build();
    }
}
