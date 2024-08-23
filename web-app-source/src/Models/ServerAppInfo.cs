namespace CephasPAD.JXOnlineWeb.Models;

public class ServerAppInfo(string name, string executable, string workingDirectory, bool isWine = false)
{
    public string Name { get; } = name;
    public string Executable { get; } = executable;
    public string WorkingDirectory { get; } = workingDirectory;
    public bool IsWine { get; } = isWine;
}
