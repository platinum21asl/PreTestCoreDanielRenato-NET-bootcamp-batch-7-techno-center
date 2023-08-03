using Dapper;
using Microsoft.AspNetCore.Mvc;
using PreTestCoreDanielRenato.Models;
using PreTestCoreDanielRenato.Repository;
using Microsoft.AspNetCore.Authorization;
using System.Data;
using System.Web.Http.ModelBinding;

namespace PreTestCoreDanielRenato.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class DocumentCategoryController : Controller
    {
        private readonly IJWTAuthManager _authentication;
        public DocumentCategoryController(IJWTAuthManager authentication)
        {
            _authentication = authentication;
        }


        [HttpGet("DocumentCategoryList")]
        [Authorize(Roles = "Admin")]
        public IActionResult getDocumentCategory()
        {
            var result = _authentication.getDocumentCategoryList<ModelDocumentCategory>();

            return Ok(result);
        }

        [HttpPost("Create")]
        [Authorize(Roles = "Admin")]
        public IActionResult Register([System.Web.Http.FromBody] ModelDocumentCategory dc)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();

            dp_param.Add("name", dc.Name, DbType.String);
            dp_param.Add("iduser", dc.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelDocumentCategory>("sp_createDocumentCategory", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = dc, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpPut("Update")]
        [Authorize(Roles = "Admin")]
        public IActionResult Update([System.Web.Http.FromBody] ModelDocumentCategory dc, string id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);

            dp_param.Add("name", dc.Name, DbType.String);
            dp_param.Add("iduser", dc.IDUser, DbType.String);

            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelDocumentCategory>("sp_updateDocumentCategory", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = dc, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpDelete("Delete")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete([System.Web.Http.FromBody] ModelDocumentCategory dc, string id)
        {
            if (id == string.Empty)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelDocumentCategory>("sp_deleteDocumentCategory", dp_param);

            if (result.Code == 200)
            {
                return Ok(new { data = dc, code = 200, message = "Success" });
            }

            return NotFound(result);
        }
    }
}
