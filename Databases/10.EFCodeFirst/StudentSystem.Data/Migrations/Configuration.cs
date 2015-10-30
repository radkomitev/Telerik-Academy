namespace StudentSystem.Data.Migrations
{
    using StudentSystem.Model;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    public sealed class Configuration : DbMigrationsConfiguration<StudentDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = false;
            ContextKey = "StudentSystem.Data.StudentDbContext";
        }

        protected override void Seed(StudentDbContext context)
        {

            context.Students.AddOrUpdate(
              p => p.Name,
              new Student 
              {
                  Name = "Dimityr Berbatov",
                  FacultyNumber = 9999
              },
              new Student 
              {
                  Name = "Stoyko Sakaliev",
                  FacultyNumber = 8888
              }
            );
         
        }
    }
}
