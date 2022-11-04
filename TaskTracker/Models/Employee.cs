using System.ComponentModel.DataAnnotations;

namespace TaskTracker.Models
{
    public class Employee
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string EmployeeName { get; set; }
    }
}
