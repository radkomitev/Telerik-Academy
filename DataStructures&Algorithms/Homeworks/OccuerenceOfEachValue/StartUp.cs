namespace OccuerenceOfEachValue
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class StartUp
    {
        static void Main()
        {
            var input = new[] { 3, 4, 4, -2.5, 3, 3, 4, 3, -2.5 };
            var dict = new Dictionary<double, int>();

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
                Console.WriteLine("{0} -> {1} times",num.Key, num.Value);
            }
        }
    }
}
