using TaskTracker.Models;

namespace TaskTracker.Interfaces
{
    public interface IProjectService
    {
        List<Project> GetAllProjects();
    }
}
