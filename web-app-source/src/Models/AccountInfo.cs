namespace CephasPAD.JXOnlineWeb.Models
{
    public class AccountInfo
    {
        public required string cAccName { get; set; }
        public required string cSecPassWord { get; set; }
        public required string cPassWord { get; set; }
        public int nExtPoint { get; set; } = 0;
        public int nExtPoint1 { get; set; } = 0;
        public int nExtPoint2 { get; set; } = 0;
        public int nExtPoint3 { get; set; } = 0;
        public int nExtPoint4 { get; set; } = 0;
        public int nExtPoint5 { get; set; } = 0;
        public int nExtPoint6 { get; set; } = 0;
        public int nExtPoint7 { get; set; } = 0;
        public int iOTPSessionLifeTime { get; set; } = 0;
        public int iServiceFlag { get; set; } = 0;
        public bool bIsBanned { get; set; } = false;
        public bool bParentalControl { get; set; } = false;
        public bool bIsUseOTP { get; set; } = false;
    }
}
