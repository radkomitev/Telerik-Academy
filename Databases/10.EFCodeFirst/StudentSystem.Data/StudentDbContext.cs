namespace StudentSystem.Data
{
    using StudentSystem.Model;
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class StudentDbContext : DbContext
    {
        public StudentDbContext()
            : base("StudDB")
        {
        }

        public virtual IDbSet<Student> Students { get; set; }
             
        public virtual IDbSet<Course> Courses { get; set; }
               
        public virtual IDbSet<Homework> Homeworks { get; set; }

    }
}
