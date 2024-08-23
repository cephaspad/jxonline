namespace CephasPAD.JXOnlineWeb.Models;

public class ServerAppProcess(ServerAppInfo serverAppInfo)
{
    public ServerAppInfo Info { get; } = serverAppInfo;
    public ServerAppStatus Status { get; protected set; } = ServerAppStatus.Idle;
    public bool IsRunning => Status == ServerAppStatus.Running;
    public void UpdateStatus(ServerAppStatus status) => Status = status;
}
