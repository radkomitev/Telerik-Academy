namespace Cosmetics.Products
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Cosmetics.Contracts;
    using Cosmetics.Common;

    public class Toothpaste : Products, IToothpaste
    {
        
        List<string> ingredients;

        public Toothpaste(string name, string brand, decimal price, GenderType gender, IList<string> ingredients)
            :base(name,brand,price,gender)
        {
            this.ingredients = new List<string>();
            this.ingredients = ingredients.ToList();           
        }

        public string Ingredients      
        {
            get { return this.ingredients.ToString(); }
            protected set
            {
                if (string.IsNullOrEmpty(value) || value.Length < 4 || value.Length > 12)
                {
                    throw new ArgumentException("Each ingredient must be between {4} and {12} symbols long!");
                }
                else
                {
                    this.ingredients.Add(value);
                }
            }
        }
        public override string ToString()
        {
            var ingredientsAsString = this.ingredients.Count() > 0
                ? string.Join(", ", this.ingredients)
                : "";

            var res = new StringBuilder();
            res.AppendLine(base.Print());
            res.AppendLine(string.Format("  * Ingredients: {0}",ingredientsAsString));          
            return res.ToString().Trim();
        }    
    }
}
