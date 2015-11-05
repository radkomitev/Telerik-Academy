namespace MusicStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Song
    {
        public int Id { get; set; }

        [Required]
        [MinLength(4)]
        [MaxLength(40)]
        public string Title { get; set; }

        public int Year { get; set; }

        public string Genre { get; set; }

        public int? ArtistId { get; set; }

        public Artist Artist { get; set; }

        public int? AlbumId { get; set; }

        public Album Album { get; set; }
    }
}
