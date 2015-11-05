namespace MusicStore.Services.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;

    public class AlbumResponseModel
    {
        public string Title { get; set; }

        public short Year { get; set; }

        public string Producer { get; set; }
    }
}