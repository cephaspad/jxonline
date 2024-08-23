using System.Collections.ObjectModel;
using System.Text.Json;

namespace CephasPAD.JXOnlineWeb.Services;

public class ProcessMapService : IProcessMapService
{
    private readonly Dictionary<string, int?> processMap = [];
    private readonly string storeFilePath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "processMap.json");

    public async Task<ReadOnlyDictionary<string, int?>> GetAsync()
    {
        if (processMap.Count == 0)
        {
            await LoadAsync();
        }
        return new ReadOnlyDictionary<string, int?>(processMap);
    }

    public async Task SetValueAsync(string key, int? value)
    {
        processMap[key] = value;
        await SaveAsync();
    }

    public async Task<int?> GetValueOrNullAsync(string key)
    { 
        if (processMap.Count == 0)
        {
            await LoadAsync();
        }
        return processMap.TryGetValue(key, out int? value) ? value : null;
    }

    private async Task LoadAsync()
    {
        if (!File.Exists(storeFilePath))
        {
            return;
        }

        var loadedProcessMapJson = await File.ReadAllTextAsync(storeFilePath);
        var loadedProcessMap = JsonSerializer.Deserialize<Dictionary<string, int?>>(loadedProcessMapJson);

        if (loadedProcessMap is null)
        {
            return;
        }

        processMap.Clear();
        foreach (var (key, value) in loadedProcessMap)
        {
            processMap[key] = value;
        }
    }

    private async Task SaveAsync()
    {
        var processMapJson = JsonSerializer.Serialize(processMap, new JsonSerializerOptions { WriteIndented = true });
        await File.WriteAllTextAsync(storeFilePath, processMapJson);
    }
}
