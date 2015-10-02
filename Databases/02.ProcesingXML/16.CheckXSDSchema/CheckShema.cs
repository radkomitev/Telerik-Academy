namespace _16.CheckXSDSchema
{
    using System;
    using System.Xml.Linq;
    using System.Xml.Schema;

    public class CheckShema
    {
        public static void Main()
        {
            var schemaToTest = new XmlSchemaSet();

            schemaToTest.Add("","../../../catalogue.xsd");
            XDocument correct = XDocument.Load("../../../catalogue.xml");
            XDocument invalid = XDocument.Load("../../invalidCatalogue.xml");

            Console.WriteLine("Validate catalogue.xml");
            Validate(schemaToTest, correct);
            Console.WriteLine();

            Console.WriteLine("Validate invalidCatalogue.xml");
            Validate(schemaToTest, invalid);
        }

        private static void Validate(XmlSchemaSet schemaToValidate, XDocument correct)
        {
            bool hasError = false;
            correct.Validate(schemaToValidate, (obj, error) =>
            {
                Console.WriteLine("{0}", error.Message);
                hasError = true;
            });
            Console.WriteLine("XML document {0}", hasError ? "did not validate" : "validated");
        }
    }
}
