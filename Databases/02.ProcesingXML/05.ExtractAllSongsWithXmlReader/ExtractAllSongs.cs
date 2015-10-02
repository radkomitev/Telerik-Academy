namespace _05.ExtractAllSongsWithXmlReader
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml;

    public class ExtractAllSongs
    {
        static void Main()
        {
            using (XmlReader reader = XmlReader.Create("../../../catalogue.xml"))
            {
                while (reader.Read())
                {
                    if (reader.Name == "title")
                    {
                        Console.WriteLine("Song with Title: {0}", reader.ReadElementString());
                    }
                }
            }
        }
    }
}
