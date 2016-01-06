namespace Cosmetics.Products
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Cosmetics.Contracts;

    public class Category : ICategory 
    {
        private string name;
        ICollection<IProduct> products;

        public Category(string name)
        {
            this.Name = name;
            this.products = new List<IProduct>();
        }
        public string Name
        {
            get
            {
                return this.name;
            }

            protected set
            {
                if (string.IsNullOrEmpty(value) || value.Length < 2 || value.Length > 15)
                {
                    throw new ArgumentException("Category name must be between 2 and 15 symbols long!");
                }

                else
                {
                    this.name = value;
                }
            }             
        }

        public void AddCosmetics(IProduct cosmetics)
        {
            this.products.Add(cosmetics);
        }

        public void RemoveCosmetics(IProduct cosmetics)
        {
            if (products.Any(x => x.Name == cosmetics.Name))
            {
                this.products.Remove(cosmetics);
            }
            else
            {
                throw new ArgumentException("Product {product name} does not exist in category {category name}!");
            }
        }

        public string Print()
        {
            var sb = new StringBuilder();
            var plural = "";

            if (products.Count==0 || products.Count>1)
            {
                plural ="products";
            }
            else
            {
                plural ="product";
            }

            var sortedProducts = this.products
                .OrderBy(x => x.Brand)
                .ThenByDescending(x => x.Price);

            sb.AppendLine(string.Format("{0} category - {1} {2} in total", this.Name, products.Count, plural));
            foreach (var product in sortedProducts)
            {
                sb.AppendLine(product.ToString());
            }
            
            return sb.ToString().Trim();
        }
    }
}
