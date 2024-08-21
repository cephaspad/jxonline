using JXOnline.WebApp.Components.Pages;
using System.Xml.Linq;

namespace JXOnline.WebApp.Models
{
	public class GameServiceProcessInfo(string name, string workingDirectory, string executable, string configFile)
	{
		public string Name { get; } = name;
		public string? Description { get; set; }
		public string WorkingDirectory { get; } = workingDirectory;
		public string Executable { get; } = executable;
		public string ConfigFile { get; } = configFile;

		public static IEnumerable<GameServiceProcessInfo> LoadAll()
		{
			const string gameServerDirectory = @"/jx";
			return
			[
				new("relay-server", $"{gameServerDirectory}/paysyswin", "S3RelayServer", "database.ini"),
				new("pay-server", $"{gameServerDirectory}/paysyswin", "Sword3PaySys", "pay-server.xml"),
				new("database-server", $"{gameServerDirectory}/gateway", "goddess_y", "goddess.ini"),
				new("pay-client", $"{gameServerDirectory}/gateway", "bishop_y", "bishop.ini"),
				new("relay-client", $"{gameServerDirectory}/gateway/s3relay", "s3relay_y", "s3relay.ini"),
				new("game-server", $"{gameServerDirectory}/server1", "jx_linux_y", "servercfg.ini"),
			];
		}
	}
}