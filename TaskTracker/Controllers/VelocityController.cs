using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TaskTracker.Interfaces;
using TaskTracker.Models;
using TaskTracker.Services;

namespace TaskTracker.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VelocityController : ControllerBase
    {
        private readonly IProjectService _projectDetails;
        private readonly IEmployeeDetailsService _employeeDetails;
        private readonly IEmployeeService _employee;
        private readonly IProjectDetailsService _projects;
        public VelocityController(IProjectService projectDetails, IEmployeeDetailsService employDetails, IEmployeeService employee, IProjectDetailsService projects)
        {
            _projectDetails = projectDetails;
            _employeeDetails = employDetails;
            _employee = employee;
            _projects = projects;
        }

        [HttpGet("Get-All-Employee")]
        public List<Employee> GetAllEmployee()
        {
            List<Employee> employees = new List<Employee>();
            employees = _employee.GetAllEmployee();
            return employees;
        }

        [HttpGet("Get-All-Project")]
        public List<Project> GetAllProject()
        {
            List<Project> projects = new List<Project>();
            projects = _projectDetails.GetAllProjects();
            return projects;
        }

        [HttpPost("Add-Employeedetails")]
        public string Post([FromForm] EmployeeDetails employeeDetails)
        {
            string msg = _employeeDetails.AddEmployeeDetails(employeeDetails);
            return msg;
        }
        [HttpPost("Add-Projectdetails")]
        public string PostProjectDetails([FromForm] ProjectDetails projectDetails)
        {
            string msg = _projects.AddProjectDetails(projectDetails);
            return msg;
        }
    }
}
