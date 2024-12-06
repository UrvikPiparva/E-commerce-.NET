

using ECommerce.Areas.Category.Models;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace ECommerce.DAL.Category
{
    public class CategoryDAL : CategoryDALBase
    {
        #region Method : dbo.PR_LOC_Category_Filter
        /* public DataTable Category_Filter(CategoryFilterModel categoryFilterModel)
         {
             DataTable dataTable = new DataTable();
             SqlDatabase sqlDatabase = new SqlDatabase(ConnectionString);
             DbCommand dbCommand = sqlDatabase.GetStoredProcCommand("CategoryFilter");

             sqlDatabase.AddInParameter(dbCommand, "@CategoryName", DbType.String, categoryFilterModel.CategoryName);
             Console.WriteLine(categoryFilterModel.CategoryName);
             using (IDataReader dataReader = sqlDatabase.ExecuteReader(dbCommand))
             {
                 dataTable.Load(dataReader);
             }
             Console.WriteLine(dataTable.Rows.Count);
             return dataTable;

         }*/
        public DataTable Category_Filter(CategoryFilterModel categoryFilterModel)
        {
            DataTable dataTable = new DataTable();
            string connectionString = "YourConnectionStringHere"; // Replace "YourConnectionStringHere" with your actual connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("CategoryFilter", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters
                    command.Parameters.Add("@CategoryName", SqlDbType.VarChar, 100).Value = categoryFilterModel.CategoryName;

                    try
                    {
                        connection.Open();
                        using (SqlDataReader dataReader = command.ExecuteReader())
                        {
                            dataTable.Load(dataReader);
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle SQL exceptions
                        Console.WriteLine("SQL Error: " + ex.Message);
                    }
                }
            }
            Console.WriteLine("Rows retrieved: " + dataTable.Rows.Count);
            return dataTable;
        }

        #endregion
    }
}
