namespace _03.ExtractAllDifferentArtistXpath
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml;

    public class ArtistWithXpath
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");

            XmlNode root = doc.DocumentElement;
            Console.WriteLine(root.Name);

            string xPath = "/catalogue/albums/artist";
            XmlNodeList artistLists = root.SelectNodes(xPath);
            /*
            foreach (XmlNode artist in artistLists) 
            {
                Console.WriteLine(artist.InnerText);
            }*/          
            var dict = new Dictionary<string, int>();

            foreach (XmlNode node in artistLists)
            {
                var artist = node.InnerText;
                if (dict.ContainsKey(artist))
                {
                    dict[artist]++;
                }
                else
                {
                    dict.Add(artist, 1);
                }
            }

            foreach (var artist in dict)
            {
                Console.WriteLine("{0}: {1} album", artist.Key, artist.Value);
            }
        }
    }
}
