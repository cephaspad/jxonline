using JXOnline.WebApp.Models;

namespace JXOnline.WebApp.ViewModels
{
    public class GameServiceProcessViewModel(GameServiceProcessInfo gameServiceProcessInfo)
    {
        public GameServiceProcessInfo Info { get; } = gameServiceProcessInfo;
        public GameServiceProcessStatus Status { get; set; } = GameServiceProcessStatus.Unknown;
    }
}
