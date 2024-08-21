﻿using System.Xml.Linq;

namespace JXOnline.WebApp.Models
{
    public class GameServiceProcessInfo(string name, string workingDirectory, string fileName, string arguments, string configFile)
	{
		public string Name { get; } = name;
		public string? Description { get; set; }
		public string WorkingDirectory { get; } = workingDirectory;
		public string FileName { get; } = fileName;
		public string Arguments { get; } = arguments;
        public string ConfigFile { get; } = configFile;

		public string GetConfigFilePath() => Path.Combine(WorkingDirectory, ConfigFile);

        public static IEnumerable<GameServiceProcessInfo> LoadAll()
		{
			const string gameServerDirectory = @"/jx";
			return
			[
                new("relay-server", $"{gameServerDirectory}/paysyswin", "/usr/bin/wine", "S3RelayServer.exe", "database.ini"),
				new("pay-server", $"{gameServerDirectory}/paysyswin", "/usr/bin/wine", "Sword3PaySys.exe", "database.ini"),
				new("database-server", $"{gameServerDirectory}/gateway", "goddess_y", "", "goddess.ini"),
				new("pay-client", $"{gameServerDirectory}/gateway", "bishop_y", "", "bishop.ini"),
				new("relay-client", $"{gameServerDirectory}/gateway/s3relay", "s3relay_y", "", "s3relay.ini"),
				new("game-server", $"{gameServerDirectory}/server1", "jx_linux_y", "", "servercfg.ini"),
			];
		}
	}
}