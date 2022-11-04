namespace TaskTracker.Models
{
    public class EmployeeDetails
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public string Employee { get; set; }
        public int EstimatedHours { get; set; }
        public int ActualHours { get; set; }
    }
}
