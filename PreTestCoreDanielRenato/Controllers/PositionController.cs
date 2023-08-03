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
    public class PositionController : Controller
    {
        private readonly IJWTAuthManager _authentication;
        public PositionController(IJWTAuthManager authentication)
        {
            _authentication = authentication;
        }


        [HttpGet("PositionList")]
        [Authorize(Roles = "Admin")]
        public IActionResult getPosition()
        {
            var result = _authentication.getPositionList<ModelPosition>();

            return Ok(result);
        }

        [HttpPost("Create")]
        [Authorize(Roles = "Admin")]
        public IActionResult Register([System.Web.Http.FromBody] ModelPosition position)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();

            dp_param.Add("name", position.Name, DbType.String);
            dp_param.Add("iduser", position.IDUser, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelPosition>("sp_createPosition", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = position, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpPut("Update")]
        [Authorize(Roles = "Admin")]
        public IActionResult Update([System.Web.Http.FromBody] ModelPosition position, string id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);

            dp_param.Add("name", position.Name, DbType.String);
            dp_param.Add("iduser", position.IDUser, DbType.String);

            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelPosition>("sp_updatePosition", dp_param);
            if (result.Code == 200)
            {
                return Ok(new { data = position, code = 200, message = "Success" });
            }

            return BadRequest(result);
        }

        [HttpDelete("Delete")]
        [Authorize(Roles = "Admin")]
        public IActionResult Delete([System.Web.Http.FromBody] ModelPosition position, string id)
        {
            if (id == string.Empty)
            {
                return BadRequest("Parameter is missing");
            }

            DynamicParameters dp_param = new DynamicParameters();
            dp_param.Add("ID", id, DbType.String);
            dp_param.Add("retVal", DbType.String, direction: ParameterDirection.Output);

            var result = _authentication.Execute_Command<ModelPosition>("sp_deletePosition", dp_param);

            if (result.Code == 200)
            {
                return Ok(new { data = position, code = 200, message = "Success" });
            }

            return NotFound(result);
        }
    }
}
