namespace CephasPAD.JXOnlineWeb.Models;

public class ServerAppProcess(ServerAppInfo serverAppInfo)
{
    public ServerAppInfo Info { get; } = serverAppInfo;
    public ServerAppStatus Status { get; protected set; } = ServerAppStatus.Unknown;
    public bool IsActive => Status == ServerAppStatus.Active;
    public bool HasRegistered => Status != ServerAppStatus.NotRegistered;
    public bool IsActivatingOrDeactivating => Status == ServerAppStatus.Activating || Status == ServerAppStatus.Deactivating;
    public void UpdateStatus(ServerAppStatus status) => Status = status;
}
