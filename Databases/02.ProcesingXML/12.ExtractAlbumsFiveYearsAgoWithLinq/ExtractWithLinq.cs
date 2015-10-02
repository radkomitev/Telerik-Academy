namespace _12.ExtractAlbumsFiveYearsAgoWithLinq
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml.Linq;

    class ExtractWithLinq
    {
        static void Main(string[] args)
        {
            XDocument albums = XDocument.Load("../../../catalogue.xml");

            var albumsFiveYearsAgo =
                from album in albums.Descendants("albums")
                where int.Parse(album.Element("year").Value) < 2010
                select new
                {
                    Price = album.Element("price").Value,
                };

            foreach (var price in albumsFiveYearsAgo)
            {
                Console.WriteLine("Price: {0}", price.Price);
            }
        }
    }
}
