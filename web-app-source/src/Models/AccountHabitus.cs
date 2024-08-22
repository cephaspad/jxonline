namespace CephasPAD.JXOnlineWeb.Models
{
    public class AccountHabitus
    {
        public required string cAccName { get; set; }
        public DateTime dEndDate { get; set; } = DateTime.Now.AddYears(10);
        public int iLeftSecond { get; set; } = (int)TimeSpan.FromDays(365).TotalSeconds;
    }
}
