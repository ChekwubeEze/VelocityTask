using System.ComponentModel.DataAnnotations;

namespace TaskTracker.Models
{
    public class ProjectDetails
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public int projectId { get; set; }
        [Required]
        public string Projects { get; set; }
        [Required]
        public string TaskTitle { get; set; }
        [Required]
        public string TaskDescription { get; set; }
        [Required]
        public int TotalEstimate { get; set; }
    }
}
