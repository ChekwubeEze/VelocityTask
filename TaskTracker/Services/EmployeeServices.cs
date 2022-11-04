using System.Data.SqlClient;
using TaskTracker.Interfaces;
using TaskTracker.Models;
using System.Data;

namespace TaskTracker.Services
{
    public class EmployeeServices : IEmployeeService
    {
        private readonly IConfiguration _configuration;
        private readonly string connectionstring;

        public EmployeeServices(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionstring = _configuration.GetSection("ConnectionStrings:ADOConnect").Value;
        }
        public List<Employee> GetAllEmployee()
        {
            List<Employee> employees = new List<Employee>();
            SqlConnection connection = new SqlConnection(connectionstring);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("spGetAllEmployee", connection);
            sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dataTable = new DataTable();
            connection.Open();
            sqlDataAdapter.Fill(dataTable);
            if(dataTable.Rows.Count > 0)
            {
                for(int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Employee employee = new Employee();
                    employee.Id = Convert.ToInt32(dataTable.Rows[i]["Id"]);
                    employee.EmployeeName = dataTable.Rows[i]["EmployeeName"].ToString();
                    employees.Add(employee);
                }
            }
            if (employees.Count > 0)
            {
                return employees;
            }
            else
            {
                return null;
            }
            connection.Close();

        }
    }
}
