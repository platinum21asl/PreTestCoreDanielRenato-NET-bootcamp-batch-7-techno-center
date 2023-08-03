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
    public class CompanyController : Controller
    {
        private readonly IJWTAuthManager _authentication;
        public CompanyController(IJWTAuthManager authentication)
        {
            _authentication = authentication;
        }

        [HttpGet("CompanyList")]
        [Authorize(Roles = "Admin")]
        public IActionResult getCompany()
        {
            var result = _authentication.getCompanyList<ModelCompany>();

            return Ok(result);
        }

        [HttpPost("Create")]
        [Authorize(Roles = "Admin")]
        public IActionResult Register([System.Web.Http.FromBody] ModelCompany c)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("name", c.Name, DbType.String);
            dp_param.Add("address", c.Address, DbType.String);
            dp_param.Add("telephone", c.Telephone, DbType.String);
            dp_param.Add("email", c.Email, DbType.String);

            dp_param.Add("flag", c.Flag, DbType.String);
            dp_param.Add("iduser", c.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelUser>("sp_createCompany", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = c, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpPut("Update")]
        [Authorize(Roles = "Admin")]
        public IActionResult Update([System.Web.Http.FromBody] ModelCompany c, string id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
        
            dp_param.Add("name", c.Name, DbType.String);
            dp_param.Add("address", c.Address, DbType.String);
            dp_param.Add("telephone", c.Telephone, DbType.String);
            dp_param.Add("email", c.Email, DbType.String);
    
            dp_param.Add("flag", c.Flag, DbType.String);
            dp_param.Add("iduser", c.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelCompany>("sp_updateCompany", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = c, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpDelete("Delete")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete([System.Web.Http.FromBody] ModelCompany c, string id)
        {
            if (id == string.Empty)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelCompany>("sp_deleteCompany", dp_param);

            if (result.Code == 200)
            {
                return Ok(new { data = c, code = 200, message = "Success" });
            }

            return NotFound(result);
        }
    }
}
