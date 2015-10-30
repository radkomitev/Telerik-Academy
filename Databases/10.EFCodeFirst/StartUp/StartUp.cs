namespace StartUp
{
    using StudentSystem.Data;
    using StudentSystem.Model;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Data.Entity.Validation;
    using System.Data.Entity;
    using StudentSystem.Data.Migrations;

    public class StartUp
    {
        static void Main()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<StudentDbContext, Configuration>());

            var db = new StudentDbContext();

            var student = new Student
            {
                Name = "Djordjano",
                FacultyNumber = 1313,
                Course = new List<Course>
                {
                    new Course
                    {
                        Name="Music",
                        Description="Modern music"
                    },
                    new Course
                    {
                        Name="Dance",
                        Description="Modern dancing"
                    },
                    new Course
                    {
                        CourseId=6
                    }
                }
            };

            var course = new Course
            {
                Name = "Mathematics Fundamentals Second Part",
                Description = "All secrets about mathematics",
                Homeworks = new List<Homework>
                {
                    new Homework
                    {
                        Content="Task 5",
                        TimeSent = DateTime.Now
                    },
                    new Homework
                    {
                        Content="Task 6",
                        TimeSent = DateTime.Now
                    }             
                }
            };

            

            db.Students.Add(student);
           // db.Courses.Add(course);
           
            try
            {
                db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
 
            }

            Console.WriteLine(db.Students.Count());
        }
    }
}
