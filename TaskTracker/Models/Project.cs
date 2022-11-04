using System.ComponentModel.DataAnnotations;

namespace TaskTracker.Models
{
    public class Project
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string ProjectName { get; set; }
    }
}
