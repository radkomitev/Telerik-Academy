namespace Cosmetics.Products
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Cosmetics.Contracts;
    using Cosmetics.Common;

    public abstract class Products : IProduct
    {
        private string name;
        private string brand;

        public Products(string name, string brand, decimal price, GenderType gender)
        {
            this.Name = name;
            this.Brand = brand;
            this.Price = price;
            this.Gender = gender;             
        }

        public string Name
        {
            get
            {
                return this.name ;
            }

            protected set 
            {
                if (string.IsNullOrEmpty(value) ||  value.Length < 3 || value.Length > 10)
                {
                    throw new ArgumentException("Product name must be between 3 and 10 symbols long!");
                }
                else 
                {
                    this.name = value;
                }
            }
        }

        public string Brand
        {
            get
            {
                return this.brand;
            }

            protected set
            {
                if (string.IsNullOrEmpty(value) || value.Length < 2 || value.Length > 10)
                {
                    throw new ArgumentException("Product brand must be between 2 and 10 symbols long!");
                }
                else
                {
                    this.brand = value;
                }               
            }
        }

        public decimal Price { get; protected set; }

        public Common.GenderType Gender { get; protected set; }
       
        public string Print()
        {
            var result = new StringBuilder();
            result.AppendLine(string.Format("- {0} - {1}:", this.Brand, this.Name));
            result.AppendLine(string.Format("  * Price: ${0}", this.Price));
            result.AppendLine(string.Format("  * For gender: {0}", this.Gender));
            return result.ToString().Trim();
        }
    }
}
