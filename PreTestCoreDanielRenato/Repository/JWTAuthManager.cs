using Dapper;
using Microsoft.IdentityModel.Tokens;
using PreTestCoreDanielRenato.Models;
using System.Data.SqlClient;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PreTestCoreDanielRenato.Repository
{
    public class JWTAuthManager : IJWTAuthManager
    {
        private readonly IConfiguration _configuration;
        public JWTAuthManager(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        //generate jwt token
        public Response<string> GenerateJWT(ModelUser user)
        {
            Response<string> response = new Response<string>();

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JwtAuth:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            //claim is used to add identity to JWT token
            var claims = new[] {
                new Claim(JwtRegisteredClaimNames.Sub, user.Username),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim("roles", user.Role),
                new Claim("Date", DateTime.Now.ToString()),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var token = new JwtSecurityToken(_configuration["JwtAuth:Issuer"],
              _configuration["JwtAuth:Issuer"],
              claims,    //null original value
              expires: DateTime.Now.AddMinutes(120),
              signingCredentials: credentials);

            response.Data = new JwtSecurityTokenHandler().WriteToken(token); //return access token
            response.Code = 200;
            response.Message = "Token has generate";

            return response;
        }

        public Response<T> Execute_Command<T>(string query, DynamicParameters sp_params)
        {
            Response<T> response = new Response<T>();

            using (IDbConnection dbConnection = new SqlConnection(_configuration.GetConnectionString("default")))
            {
                if (dbConnection.State == ConnectionState.Closed)
                    dbConnection.Open();

                using var transaction = dbConnection.BeginTransaction();

                try
                {
                    response.Data = dbConnection.Query<T>(query, sp_params, commandType: CommandType.StoredProcedure, transaction: transaction).FirstOrDefault();
                    response.Code = sp_params.Get<int>("retVal"); //get output parameter value
                    response.Message = "Success";
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    response.Code = 500;
                    response.Message = ex.Message;
                }
            }

            return response;
        }

        public Response<List<T>> getUserList<T>()
        {
            Response<List<T>> response = new Response<List<T>>();
            using IDbConnection db = new SqlConnection(_configuration.GetConnectionString("default"));
            string query = "select * from Table_User";

            try
            {
                response.Data = db.Query<T>(query, null, commandType: CommandType.Text).ToList();
                response.Code = 200;
                response.Message = "Success";
            }
            catch (Exception ex)
            {
                response.Code = 500;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response<List<T>> getPositionList<T>()
        {
            Response<List<T>> response = new Response<List<T>>();
            using IDbConnection db = new SqlConnection(_configuration.GetConnectionString("default"));
            string query = "select * from Table_Position";

            try
            {
                response.Data = db.Query<T>(query, null, commandType: CommandType.Text).ToList();
                response.Code = 200;
                response.Message = "Success";
            }
            catch (Exception ex)
            {
                response.Code = 500;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response<List<T>> getDocumentCategoryList<T>()
        {
            Response<List<T>> response = new Response<List<T>>();
            using IDbConnection db = new SqlConnection(_configuration.GetConnectionString("default"));
            string query = "select * from Table_Document_Category";

            try
            {
                response.Data = db.Query<T>(query, null, commandType: CommandType.Text).ToList();
                response.Code = 200;
                response.Message = "Success";
            }
            catch (Exception ex)
            {
                response.Code = 500;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response<List<T>> getCompanyList<T>()
        {
            Response<List<T>> response = new Response<List<T>>();
            using IDbConnection db = new SqlConnection(_configuration.GetConnectionString("default"));
            string query = "select * from Table_Company";

            try
            {
                response.Data = db.Query<T>(query, null, commandType: CommandType.Text).ToList();
                response.Code = 200;
                response.Message = "Success";
            }
            catch (Exception ex)
            {
                response.Code = 500;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response<List<T>> getDocumentList<T>()
        {
            Response<List<T>> response = new Response<List<T>>();
            using IDbConnection db = new SqlConnection(_configuration.GetConnectionString("default"));
            string query = "select * from Table_Document";

            try
            {
                response.Data = db.Query<T>(query, null, commandType: CommandType.Text).ToList();
                response.Code = 200;
                response.Message = "Success";
            }
            catch (Exception ex)
            {
                response.Code = 500;
                response.Message = ex.Message;
            }

            return response;
        }
    }
}
