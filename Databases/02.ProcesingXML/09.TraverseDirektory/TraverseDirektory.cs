namespace _09.TraverseDirectory
{
    using System.IO;
    using System.Text;
    using System.Xml;

    public class Program
    {
        static void Main()
        {
            string fileName = "../../XmlToTraverse.xml";
            Encoding encoding = Encoding.UTF8;
            DirectoryInfo allPath = new DirectoryInfo(@"D:\TELERIK\Homeworks\11.Databases\02.Procesing XML inNET\ProcesingXML");

            using (XmlTextWriter wr = new XmlTextWriter(fileName, encoding))
            {
                wr.Formatting = Formatting.Indented;
                wr.IndentChar = '\t';
                wr.Indentation = 2;
                wr.WriteStartDocument();
                wr.WriteStartElement("dir");
                Traverse(wr, allPath);
                wr.WriteEndDocument();
            }
        }

        private static void Traverse(XmlTextWriter writer, DirectoryInfo directory)
        {
            foreach (var dir in directory.GetDirectories())
            {
                writer.WriteStartElement("dir");
                writer.WriteAttributeString("name", dir.Name);
                Traverse(writer, dir);
                writer.WriteEndElement();
            }

            foreach (var file in directory.GetFiles())
            {
                writer.WriteStartElement("file");
                writer.WriteAttributeString("name", file.Name);
                writer.WriteEndElement();
            }
        }
    }
}