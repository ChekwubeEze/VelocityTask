namespace TaskTracker.Models
{
    public class ProjectDetails
    {
        public int Id { get; set; }
        public int projectId { get; set; }
        public string Projects { get; set; }
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public int TotalEstimate { get; set; }
    }
}
