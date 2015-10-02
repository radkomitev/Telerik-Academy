namespace _04.DeleteAllAlbumsWithPriceMoreThan20
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml;

    public class DeleteAlbumsWithPrice20OrMore
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");
            XmlNode root = doc.DocumentElement;
            foreach (XmlNode node in root.SelectNodes("albums"))
            {
                var priceToCheck = int.Parse(node["price"].InnerText);
                if (priceToCheck > 20)
                {
                    root.RemoveChild(node);
                }

            }
            doc.Save("../../../catalogueWithoutAlbumPriceMoreThan20.xml");
        }
    }
}
