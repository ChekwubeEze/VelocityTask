using System.Data;
using System.Data.SqlClient;
using TaskTracker.Interfaces;
using TaskTracker.Models;


namespace TaskTracker.Services
{
    public class EmployeeDetailsServices : IEmployeeDetailsService
    {
        private readonly IConfiguration _configuration;
        private readonly string connectionstring;

        public EmployeeDetailsServices(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionstring = _configuration.GetSection("ConnectionStrings:ADOConnect").Value;
        }
        public string AddEmployeeDetails(EmployeeDetails employee)
        {
            string message = string.Empty;
            if (employee != null)
            {
                SqlConnection connection = new SqlConnection(connectionstring);
                SqlCommand cmd = new SqlCommand("spAddEmployeeDetails", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", employee.Id);
                cmd.Parameters.AddWithValue("@EmployeeId", employee.EmployeeId);
                cmd.Parameters.AddWithValue("@Employee", employee.Employee);
                cmd.Parameters.AddWithValue("@EstimatedHours", employee.EstimatedHours);
                cmd.Parameters.AddWithValue("@ActualHours", employee.ActualHours);
                connection.Open();
                int msg = cmd.ExecuteNonQuery();
                connection.Close();
                if (msg > 0)
                {
                    message = "Error";
                }
                else
                {
                    message = "Employee has been added succesfully";
                }
            }
            return message;
        }
    }
}
