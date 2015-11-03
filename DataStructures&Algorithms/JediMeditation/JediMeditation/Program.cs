namespace JediMeditation
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Program
    {
        static void Main()
        {
            int n = int.Parse(Console.ReadLine());
            string inputs = Console.ReadLine();
            var jedies = inputs.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            var padawans = new Queue<string>();
            var knights = new Queue<string>();
            var masters = new Queue<string>();

            foreach (var j in jedies)
            {
                if (j[0] == 'm')
                {
                    masters.Enqueue(j);                  
                }
                else if (j[0] == 'p')
                {
                    padawans.Enqueue(j);
                }
                else if (j[0] == 'k')
                {
                    knights.Enqueue(j);
                }
            }

            StringBuilder result = new StringBuilder();

            result.Append(string.Join(" ", masters));
            result.Append(" ");
            result.Append(string.Join(" ", knights));
            result.Append(" ");
            result.Append(string.Join(" ", padawans));

            Console.WriteLine(result.ToString());
        }
    }
}
