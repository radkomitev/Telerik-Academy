namespace Cosmetics.Products
{   
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Cosmetics.Contracts;

    public class ShoppingCart : IShoppingCart
    {
        ICollection<IProduct> products;
        
        

        public ShoppingCart()
        {
            this.products = new List<IProduct>();
        }

        public void AddProduct(IProduct product)
        {
            this.products.Add(product);
        }

        public void RemoveProduct(IProduct product)
        {
            this.products.Remove(product);
        }

        public bool ContainsProduct(IProduct product)
        {
            if (products.Any(x => x.Name == product.Name))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public decimal TotalPrice()
        {
            decimal result = 0;

            foreach (var product in products)
            {
                result += product.Price;
            }
          return result;
        }
    }
}
