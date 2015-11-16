namespace PriorityQueue
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Wintellect.PowerCollections;

    public class StartUp
    {
        static void Main()
        {
            var bag = new PriorityQueue<Car>();

            var opel = new Car
            {
                Model = "Opel",
                Price = 1000
            };
            var mercedes = new Car
            {
                Model = "Mercedes",
                Price = 5000
            };

            var citroen = new Car
            {
                Model = "Citroen",
                Price = 3000
            };

            bag.Enqueue(opel);
            bag.Enqueue(mercedes);
            bag.Enqueue(citroen);

            while(bag.Count > 0)
            {
                var car = bag.Dequeue();
                Console.WriteLine("{0} -> {1}",car.Model, car.Price);
            }

        }
    }
}
