using MusicStore.Data;
using MusicStore.Models;
using MusicStore.Services.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace MusicStore.Services.Controllers
{
    public class SongController : ApiController
    {
        private IRepository<Song> songs;

        public SongController()
            : this(new Repository<Song>())
        {
        }

        public SongController(IRepository<Song> songs)
        {
            this.songs = songs;
        }

        [HttpGet]
        public IHttpActionResult All()
        {
            var songs = this.songs.All().Select(a => new SongResponseModel
                {
                    Id = a.Id,
                    Title = a.Title
                });

            return Ok(songs);
        }

        [HttpPost]
        public IHttpActionResult Create(Song song)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var newSong = new Song
            {
                Title = song.Title,
                Year = song.Year,
                Genre = song.Genre,
                AlbumId = song.AlbumId,
                ArtistId = song.ArtistId
            };

            this.songs.Add(newSong);
            this.songs.SaveChanges();

            return Ok(newSong);
        }

        [HttpPut]
        public IHttpActionResult Update(int id, Song song)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingSong = this.songs.All().FirstOrDefault(a => a.Id == id);

            if (existingSong == null)
            {
                return BadRequest("Not exist");
            }

            existingSong.Title = song.Title;
            this.songs.SaveChanges();

            return Ok(songs);
        }

        [HttpDelete]
        public IHttpActionResult Delete(int id)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingSong = this.songs.All().FirstOrDefault(a => a.Id == id);

            if (existingSong == null)
            {
                return BadRequest("Not exist");
            }

            songs.Delete(existingSong);
            this.songs.SaveChanges();

            return Ok(songs);
        }
    }
}
