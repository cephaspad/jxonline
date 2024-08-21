namespace CephasPAD.JXOnlineWeb.Models
{
    public class GameServiceProcess(GameServiceProcessInfo gameServiceProcessInfo)
    {
        public GameServiceProcessInfo Info { get; } = gameServiceProcessInfo;
        public bool IsRunning { get; private set; } = false;
        public void MarkAsRunning() => IsRunning = true;
        public void MarkAsStopped() => IsRunning = false;
    }
}