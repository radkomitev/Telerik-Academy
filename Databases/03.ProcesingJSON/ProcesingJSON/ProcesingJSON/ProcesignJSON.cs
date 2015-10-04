namespace Example
{
    using JSONProcessing;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Linq;
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Net;
    using System.Text;
    using System.Threading.Tasks;
    using System.Xml;

    public class ProcesingJSON
    {
        private const string RSS_LINK = "https://www.youtube.com/feeds/videos.xml?channel_id=UCLC-vbm7OWvpbqzXaoAMGGw";

        static void Main()
        {
            var webClient = new WebClient();
            var rssInfo = webClient.DownloadData(RSS_LINK);
            var data = Encoding.UTF8.GetString(rssInfo);

            var doc = new XmlDocument();
            doc.LoadXml(data);

            var json = JsonConvert.SerializeXmlNode(doc);

            var titles = GetVideoTitles(json);
            PrintTitles(titles);

            var videos = GetVideos(json);
            GenerateHtml(videos);
        }

        private static IEnumerable<JToken> GetVideoTitles(string jSon)
        {
            var jSonObj = JObject.Parse(jSon);
            var titles = jSonObj["feed"]["entry"]
                .Select(entry => entry["title"]);
            return titles;
        }

        private static void PrintTitles(IEnumerable<JToken> titles)
        {
            foreach (var title in titles)
            {
                Console.WriteLine(title);
            }
        }

        private static IEnumerable<Video> GetVideos(string json)
        {
            var jsonObject = JObject.Parse(json);

            return jsonObject["feed"]["entry"]
                   .Select(entry => JsonConvert.DeserializeObject<Video>(entry.ToString()));
        }

        private static void GenerateHtml(IEnumerable<Video> videos)
        {
            var html = "<!DOCTYPE html><html><body>";

            foreach (var video in videos)
            {
                html += string.Format("<div style=\"float:left; width: 400px; height: 430px; padding:10px;" +
                                  "margin:5px; background-color:orange;\">" +
                                  "<iframe width=\"400\" height=\"325\" " +
                                  "src=\"http://www.youtube.com/embed/{2}?autoplay=0\"" +
                                  "frameborder=\"0\" allowfullscreen></iframe>" +
                                  "<h3>{1}</h3><a href=\"{0}\"><button>" +
                                  "<strong>Go to YouTube</strong></button></a></div>", video.Link.Href, video.Title, video.Id);
            }

            html += ("</body></html>");

            File.WriteAllText("../../index.html", html);
        }
    }
}
