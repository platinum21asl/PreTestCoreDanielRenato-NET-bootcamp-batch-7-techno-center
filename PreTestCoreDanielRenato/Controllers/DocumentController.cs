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
    public class DocumentController : Controller
    {
        private readonly IJWTAuthManager _authentication;
        public DocumentController(IJWTAuthManager authentication)
        {
            _authentication = authentication;
        }

        [HttpGet("DocumentList")]
        [Authorize(Roles = "Admin")]
        public IActionResult getDocument()
        {
            var result = _authentication.getDocumentList<ModelDocument>();

            return Ok(result);
        }

        [HttpPost("Create")]
        [Authorize(Roles = "Admin")]
        public IActionResult Register([System.Web.Http.FromBody] ModelDocument d)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("idcompany", d.IDCompany, DbType.String);
            dp_param.Add("idcategory", d.IDCategory, DbType.String);
            dp_param.Add("name", d.Name, DbType.String);
            dp_param.Add("description", d.Description, DbType.String);
         
            dp_param.Add("flag", d.Flag, DbType.String);
            dp_param.Add("iduser", d.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelUser>("sp_createDocument", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = d, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpPut("Update")]
        [Authorize(Roles = "Admin")]
        public IActionResult Update([System.Web.Http.FromBody] ModelDocument d, string id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);

            dp_param.Add("idcompany", d.IDCompany, DbType.String);
            dp_param.Add("idcategory", d.IDCategory, DbType.String);
            dp_param.Add("name", d.Name, DbType.String);
            dp_param.Add("description", d.Description, DbType.String);

            dp_param.Add("flag", d.Flag, DbType.String);
            dp_param.Add("iduser", d.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelDocument>("sp_updateDocument", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = d, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpDelete("Delete")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete([System.Web.Http.FromBody] ModelDocument d, string id)
        {
            if (id == string.Empty)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelDocument>("sp_deleteDocument", dp_param);

            if (result.Code == 200)
            {
                return Ok(new { data = d, code = 200, message = "Success" });
            }

            return NotFound(result);
        }

    }
}
