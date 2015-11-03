namespace OddOccuerencesElements
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
            var input = new[] { "C#", "SQL", "PHP", "PHP", "SQL", "SQL" };
            var dict = new Dictionary<string, int>();

            foreach (var num in input)
            {
                if (dict.ContainsKey(num))
                {
                    dict[num]++;
                }
                else
                {
                    dict.Add(num, 1);
                }
            }

            foreach (var num in dict)
            {
                if (num.Value % 2 != 0)
                {
                    Console.WriteLine("{0} -> {1} times", num.Key, num.Value);
                }
            }
        }
    }
}
