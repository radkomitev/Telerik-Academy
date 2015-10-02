namespace _06.ExtractAllSongsWithCDocumentAndLinq
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml.Linq;

    public class ExtractAllSongsWithCDocumentAndLinq
    {
        static void Main()
        {
            XDocument albums = XDocument.Load("../../../catalogue.xml");
            var songs =
                from song in albums.Descendants("songs")
                select new
                {
                    Title = song.Element("title").Value,
                };

            foreach (var title in songs)
            {
                Console.WriteLine("Song with Title: {0}", title.Title);
            }
        }
    }
}
