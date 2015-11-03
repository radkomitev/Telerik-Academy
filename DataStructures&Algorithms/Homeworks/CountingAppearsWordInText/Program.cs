namespace CountingAppearsWordInText
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Program
    {
        public static void Main()
        {
            var text = ReadFromFile();
            CountWordsFromFile(text);
        }

        private static string ReadFromFile()
        {
            var line = "";
            using (StreamReader sr = new StreamReader("Text.txt"))
            {
                line = sr.ReadToEnd();
                Console.WriteLine(line);
            }
            return line;
        }

        private static void CountWordsFromFile(string line)
        {
            var words = line.Trim().Split(new[] { ' ', '-', '.', ',', '!', '?' });
            var meanWords = new Dictionary<string, int>();

            foreach (var word in words)
            {
                if (word != string.Empty && word != "?" && word != "!" && word != "." && word != ",")
                {
                    var lowerWord = word.ToLower();
                    if (meanWords.ContainsKey(lowerWord))
                    {
                        meanWords[lowerWord]++;
                    }
                    else
                    {
                        meanWords.Add(lowerWord, 1);
                    }
                }
            }
            var dict = meanWords.OrderBy(x => x.Value);
            foreach (var word in dict)
            {
                Console.WriteLine("{0} -> {1} times", word.Key, word.Value);
            }
        }
    }
}
