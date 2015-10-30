namespace EF
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Linq;

    public class Program
    {
        static void Main()
        {
            using (var db = new TelerikAcademyEntities())
            {
                var empl = db.Employees
                    .Where(e => e.Department.Name == "Sales")
                    .Select(e => new
                    {
                       FirstName =  e.FirstName,
                       AddressTextt = e.Address.AddressText,
                       DN = e.Department.Name
                    })
                    .ToList();

                foreach (var e in empl)
                {
                    Console.WriteLine(e.FirstName + ' ' + e.AddressTextt + ' ' + e.DN);
                }
                
            }
        }
    }
}
