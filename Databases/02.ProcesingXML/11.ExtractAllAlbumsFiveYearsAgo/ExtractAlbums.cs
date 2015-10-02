namespace _11.ExtractAllAlbumsFiveYearsAgo
{
    using System;
    using System.Xml;

    public class ExtractAlbums
    {
        static void Main()
        {
            XmlDocument doc = new XmlDocument();
            doc.Load("../../../catalogue.xml");

            XmlNode root = doc.DocumentElement;
            string xPath = "/catalogue/albums[year<2010]/price";          
            XmlNodeList artistLists = root.SelectNodes(xPath);
            
            foreach (XmlNode albumFiveYearsAgo in artistLists)
            {
                Console.WriteLine("Price is: {0}", albumFiveYearsAgo.InnerText);
            }
        }
    }
}
