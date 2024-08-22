namespace CephasPAD.JXOnlineWeb.Models;

public class ServerAppInfo(string name, string path)
{
    public string Name { get; } = name;
    public string Path { get; } = path;
}
