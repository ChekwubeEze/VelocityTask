using System.Data;
using System.Data.SqlClient;
using TaskTracker.Interfaces;
using TaskTracker.Models;

namespace TaskTracker.Services
{
    public class ProjectServices : IProjectService
    {
        private readonly IConfiguration _configuration;
        private readonly string connectionstring;

        public ProjectServices(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionstring = _configuration.GetSection("ConnectionStrings:ADOConnect").Value;
        }
        public List<Project> GetAllProjects()
        {
            List<Project> projects = new List<Project>();
            SqlConnection connection = new SqlConnection(connectionstring);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("spGetAllProject", connection);
            sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dataTable = new DataTable();
            connection.Open();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Project project = new Project();
                    project.Id = Convert.ToInt32(dataTable.Rows[i]["Id"]);
                    project.ProjectName = dataTable.Rows[i]["ProjectName"].ToString();
                    projects.Add(project);
                }
            }
            if (projects.Count > 0)
            {
                return projects;
            }
            else
            {
                return null;
            }
            connection.Close();

        }
    }
}
