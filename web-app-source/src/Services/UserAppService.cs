using CephasPAD.JXOnlineWeb.Models;
using Dapper;
using LiteDB;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using Volo.Abp.Data;

namespace CephasPAD.JXOnlineWeb.Services
{
    public class UserAppService(IConnectionStringResolver connectionStringResolver) : JXOnlineWebAppService, IUserAppService
    {
        public async Task CreateAsync(string accName)
        {
            var connectionString = await connectionStringResolver.ResolveAsync("Default");
            using var connection = new SqlConnection(connectionString);
            await connection.OpenAsync();
            var accountInfo = new AccountInfo
            {
                cAccName = accName,
                cSecPassWord = GenerateMD5("123123123"),
                cPassWord = GenerateMD5("123123"),
                nExtPoint = 1,
                nExtPoint1 = 0,
                nExtPoint2 = 0,
                nExtPoint3 = 0,
                nExtPoint4 = 0,
                nExtPoint5 = 0,
                nExtPoint6 = 0,
                nExtPoint7 = 0,
                iOTPSessionLifeTime = 0,
                iServiceFlag = 0,
                bIsBanned = false,
                bParentalControl = false,
                bIsUseOTP = false
            };
            var accountHabitus = new AccountHabitus
            {
                cAccName = accName,
                dEndDate = DateTime.Now.AddYears(10),
                iLeftSecond = 3600 * 24 * 365 * 10
            };
            using var transaction = await connection.BeginTransactionAsync();
            try
            {
                await connection.ExecuteAsync("INSERT INTO Account_Info (cAccName,cSecPassWord, cPassWord,nExtPoint,nExtPoint1,nExtPoint2,nExtPoint3,nExtPoint4,nExtPoint5,nExtPoint6,nExtPoint7,iOTPSessionLifeTime,iServiceFlag,bIsBanned,bParentalControl,bIsUseOTP) VALUES (@cAccName,@cSecPassWord,@cPassWord,@nExtPoint,@nExtPoint1,@nExtPoint2,@nExtPoint3,@nExtPoint4,@nExtPoint5,@nExtPoint6,@nExtPoint7,@iOTPSessionLifeTime,@iServiceFlag,@bIsBanned,@bParentalControl,@bIsUseOTP)", accountInfo, transaction);
                await connection.ExecuteAsync("INSERT INTO Account_Habitus (cAccName,dEndDate,iLeftSecond) VALUES (@cAccName,@dEndDate,@iLeftSecond)", accountHabitus, transaction);
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
            }
            finally
            {
                await connection.CloseAsync();
            }
        }

        public async Task DeleteAsync(string accName)
        {
            var connectionString = await connectionStringResolver.ResolveAsync("Default");
            using var connection = new SqlConnection(connectionString);
            await connection.OpenAsync();
            using var transaction = await connection.BeginTransactionAsync();

            try
            {
                await connection.ExecuteAsync("DELETE FROM Account_Info WHERE cAccName = @cAccName", new { cAccName = accName }, transaction);
                await connection.ExecuteAsync("DELETE FROM Account_Habitus WHERE cAccName = @cAccName", new { cAccName = accName }, transaction);
                await connection.ExecuteAsync("DELETE FROM Role WHERE Account = @cAccName", new { cAccName = accName }, transaction);
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
            }
            finally
            {
                connection.Close();
            }
        }

        public async Task DeleteCharacterAsync(int id)
        {
            var connectionString = await connectionStringResolver.ResolveAsync("Default");
            using var connection = new SqlConnection(connectionString);
            await connection.OpenAsync();
            using var transaction = await connection.BeginTransactionAsync();

            try
            {
                await connection.ExecuteAsync("DELETE FROM Role WHERE Id = @id", new { Id = id }, transaction);
                await transaction.CommitAsync();
            }
            catch
            {
                await transaction.RollbackAsync();
            }
            finally
            {
                await connection.CloseAsync();
            }
        }

        static string GenerateMD5(string accPass)
        {
            using MD5 md5Hash = MD5.Create();
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(accPass));
            StringBuilder stringBuilder = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                stringBuilder.Append(data[i].ToString("x2"));
            }

            return stringBuilder.ToString();
        }
    }
}
