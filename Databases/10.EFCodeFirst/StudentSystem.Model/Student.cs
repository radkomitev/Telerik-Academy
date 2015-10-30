namespace StudentSystem.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Student
    {
        private ICollection<Course> courses;

        public Student()
        {
            this.courses = new List<Course>();
        }
        public int StudentId { get; set; }
        
        [Required]
        [MaxLength(40)]
        public string Name { get; set; }
        
        [Range(1000,10000)]
        public int FacultyNumber { get; set; }

        public virtual ICollection<Course> Course
        {
            get { return this.courses; }
            set { this.courses = value; }
        }
    }
}
