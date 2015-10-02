namespace _07.TextTransformToXML
{
    using System.Dynamic;
    using System.IO;
    using System.Xml.Linq;

    public class TransformTextToXML
    {
        static void Main()
        {
            dynamic DB = new ExpandoObject();
            using (StreamReader reader = new StreamReader("../../Person.txt"))
            {
                DB.Name = reader.ReadLine();
                DB.Adress = reader.ReadLine();
                DB.Phone = reader.ReadLine();
            }

            XElement person = new XElement("Person",
                new XElement("name",DB.Name),
                new XElement("address",DB.Adress),
                new XElement("phone",DB.Phone));

            person.Save("../../person.xml");
        }
    }
}
