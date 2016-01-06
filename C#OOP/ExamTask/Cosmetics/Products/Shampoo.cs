namespace Cosmetics.Products
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Cosmetics.Contracts;
    using Cosmetics.Common;

    public class Shampoo : Products, IShampoo
    {
        public Shampoo(string name, string brand, decimal price, GenderType gender, uint milliliters, UsageType usage)
            :base(name, brand, price, gender)
        {
            this.Milliliters = milliliters;
            this.Usage = usage;
        }

        public uint Milliliters { get; protected set; }

        public UsageType Usage { get; protected set; }
        
        public override string ToString()
        {
            var res = new StringBuilder();
            res.AppendLine(base.Print());
            res.AppendLine(string.Format("  * Quantity: {0} ml", this.Milliliters));
            res.AppendLine(string.Format("  * Usage: {0}", this.Usage));
            return res.ToString().Trim();
        }
    }
}

