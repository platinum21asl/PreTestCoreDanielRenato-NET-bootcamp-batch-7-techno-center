using Dapper;
using PreTestCoreDanielRenato.Models;

namespace PreTestCoreDanielRenato.Repository
{
    public interface IJWTAuthManager
    {
        Response<string> GenerateJWT(ModelUser user);

        Response<T> Execute_Command<T>(string query, DynamicParameters sp_params);
        Response<List<T>> getUserList<T>();

        Response<List<T>> getPositionList<T>();
        Response<List<T>> getDocumentCategoryList<T>();

        Response<List<T>> getCompanyList<T>();
        Response<List<T>> getDocumentList<T>();





    }
}
