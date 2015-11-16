namespace PriorityQueue
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Car : IComparable<Car>
    {
        public string Model { get; set; }

        public decimal Price { get; set; }

        public int CompareTo(Car other)
        {
            return this.Price.CompareTo(other.Price);
        }
    }
}
