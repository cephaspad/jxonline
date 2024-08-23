using System.Collections.Specialized;

namespace CephasPAD.JXOnlineWeb.Models;

public class ServerAppInfo(string name, string executable, string workingDirectory, IDictionary<string, string?>? environment = null, bool isWine = false)
{
    public string Name { get; } = name;
    public string Executable { get; } = executable;
    public string WorkingDirectory { get; } = workingDirectory;
    public IDictionary<string, string?> Environment { get; } = environment
        ?? new Dictionary<string, string?>();
    public bool IsWine { get; } = isWine;
}
