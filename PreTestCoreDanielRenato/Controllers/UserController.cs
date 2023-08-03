using Dapper;
using Microsoft.AspNetCore.Mvc;
using PreTestCoreDanielRenato.Models;
using PreTestCoreDanielRenato.Repository;
using Microsoft.AspNetCore.Authorization;
using System.Data;

namespace PreTestCoreDanielRenato.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly IJWTAuthManager _authentication;
        public UserController(IJWTAuthManager authentication)
        {
            _authentication = authentication;
        }

        [HttpPost("Login")]
        [AllowAnonymous]
        public IActionResult Login([FromBody] LoginModel user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Paramter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("email", user.Email, DbType.String);
            dp_param.Add("password", user.Password, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelUser>("sp_loginUser", dp_param);

            if (result.Code == 200)
            {
                var token = _authentication.GenerateJWT(result.Data);

                return Ok(token);
            }

            return NotFound(result.Data);
        }

        [HttpGet("UserList")]
        [Authorize(Roles = "Admin")]
        public IActionResult getUser()
        {
            var result = _authentication.getUserList<ModelUser>();

            return Ok(result);
        }

        [HttpPost("Create")]
        [Authorize(Roles = "Admin")]
        public IActionResult Register([System.Web.Http.FromBody] ModelUser user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("idcompany", user.IDCompany, DbType.String);
            dp_param.Add("idposition", user.IDCompany, DbType.String);
            dp_param.Add("name", user.Name, DbType.String);
            dp_param.Add("address", user.Address, DbType.String);
            dp_param.Add("telephone", user.Telephone, DbType.String);
            dp_param.Add("email", user.Email, DbType.String);
            dp_param.Add("username", user.Username, DbType.String);
            dp_param.Add("password", user.Password, DbType.String);
            dp_param.Add("role", user.Role, DbType.String);
            dp_param.Add("flag", user.Flag, DbType.String);
            dp_param.Add("iduser", user.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelUser>("sp_createUser", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = user, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpPut("Update")]
        [Authorize(Roles = "Admin")]
        public IActionResult Update([System.Web.Http.FromBody] ModelUser user, string id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
            dp_param.Add("idcompany", user.IDCompany, DbType.String);
            dp_param.Add("idposition", user.IDCompany, DbType.String);
            dp_param.Add("name", user.Name, DbType.String);
            dp_param.Add("address", user.Address, DbType.String);
            dp_param.Add("telephone", user.Telephone, DbType.String);
            dp_param.Add("email", user.Email, DbType.String);
            dp_param.Add("username", user.Username, DbType.String);
            dp_param.Add("password", user.Password, DbType.String);
            dp_param.Add("role", user.Role, DbType.String);
            dp_param.Add("flag", user.Flag, DbType.String);
            dp_param.Add("iduser", user.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelUser>("sp_updateUser", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = user, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpDelete("Delete")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete([System.Web.Http.FromBody] ModelUser user, string id)
        {
            if (id == string.Empty)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelUser>("sp_deleteUser", dp_param);

            if (result.Code == 200)
            {
                return Ok(new { data = user, code = 200, message = "Success" });
            }

            return NotFound(result);
        }

    }
}
