namespace _02.ExtractAllDifferentsArtists
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml;

    public class Program
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");
            XmlNode root = doc.DocumentElement;
            Console.WriteLine(root.Name);

            var dict = new Dictionary<string, int>();

            foreach (XmlNode node in root.ChildNodes) 
            {
                var artist = node["artist"].InnerText;
                if (dict.ContainsKey(artist))
                {
                    dict[artist]++;
                }
                else
                {
                    dict.Add(artist, 1);
                }
                //Console.WriteLine("{0} -> {1}", node["artist"].InnerText, node["name"].InnerText);
            }

            foreach (var artist in dict)
            {
                Console.WriteLine("{0}: {1} album", artist.Key, artist.Value);
            }
            /*
            foreach (XmlNode node in root.ChildNodes)
            {
                foreach (XmlNode atr in node.ChildNodes)
                {
                    Console.WriteLine("{0} {1}", atr.Name, atr.InnerText);
                }
            }*/

        }
    }
}
