namespace _08.CreateAlbumWithXmlWriter
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml;

    public class CreateAlbum
    {
        static void Main()
        {
            string fileName = "../../album.xml";
            Encoding encoding = Encoding.GetEncoding("windows-1251");
            using (XmlTextWriter writer = new XmlTextWriter(fileName, encoding))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 2;

                writer.WriteStartDocument();
                writer.WriteStartElement("albums");

                using (XmlReader reader = XmlReader.Create("../../../catalogue.xml"))
                {
                    while (reader.Read())
                    {
                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "name")
                        {
                            writer.WriteStartElement("album");
                            writer.WriteElementString("name", reader.ReadElementString());
                        }
                        else if (reader.NodeType == XmlNodeType.Element && reader.Name == "artist")
                        {
                            writer.WriteElementString("artist", reader.ReadElementString());
                            writer.WriteEndElement();
                        }                      
                    }
                }
                Console.WriteLine("Finish");
            }
        }
    }
}
