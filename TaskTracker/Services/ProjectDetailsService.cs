using System.Data;
using System.Data.SqlClient;
using TaskTracker.Interfaces;
using TaskTracker.Models;

namespace TaskTracker.Services
{
    public class ProjectDetailsService : IProjectDetailsService
    {
        private readonly IConfiguration _configuration;
        private readonly string connectionstring;

        public ProjectDetailsService(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionstring = _configuration.GetSection("ConnectionStrings:ADOConnect").Value;
        }
        public string AddProjectDetails(ProjectDetails projectdetails)
        {
            string message = string.Empty;
            if (projectdetails != null)
            {
                SqlConnection connection = new SqlConnection(connectionstring);
                SqlCommand cmd = new SqlCommand("spAddProjectDetails", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", projectdetails.Id);
                cmd.Parameters.AddWithValue("@projectId", projectdetails.projectId);
                cmd.Parameters.AddWithValue("@Projects", projectdetails.Projects);
                cmd.Parameters.AddWithValue("@TaskTitle", projectdetails.TaskTitle);
                cmd.Parameters.AddWithValue("@TaskDescription", projectdetails.TaskDescription);
                cmd.Parameters.AddWithValue("@TotalEstimate", projectdetails.TotalEstimate);
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
