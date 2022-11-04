using TaskTracker.Models;

namespace TaskTracker.Interfaces
{
    public interface IEmployeeService
    {
        List<Employee> GetAllEmployee();
    }
}
