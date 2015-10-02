namespace _10.TraverseDirectoryXDocument
{
    using System.IO;
    using System.Xml.Linq;

    class TraverseWithXDocument
    {

        static void Main()
        {
            DirectoryInfo pathInfo = new DirectoryInfo(@"D:\TELERIK\Homeworks\11.Databases\02.Procesing XML inNET\ProcesingXML");

            XElement dirXml = new XElement("dir");
            dirXml.Add(TraverseDirectory(pathInfo));
            dirXml.Save("../../resultDir.xml");
        }

        private static XElement TraverseDirectory(DirectoryInfo directoryInfo)
        {
            XElement dirElement = new XElement("dir", new XAttribute("name", directoryInfo.Name));

            foreach (var directory in directoryInfo.GetDirectories())
            {
                dirElement.Add(TraverseDirectory(directory));
            }

            foreach (var file in directoryInfo.GetFiles())
            {
                dirElement.Add(new XElement("file", new XAttribute("name", file.Name)));
            }

            return dirElement;
        }
    }
}