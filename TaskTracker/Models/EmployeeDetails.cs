using System.ComponentModel.DataAnnotations;

namespace TaskTracker.Models
{
    public class EmployeeDetails
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public int EmployeeId { get; set; }
        [Required]
        public string Employee { get; set; }
        [Required]
        public int EstimatedHours { get; set; }
        [Required]
        public int ActualHours { get; set; }
    }
}
