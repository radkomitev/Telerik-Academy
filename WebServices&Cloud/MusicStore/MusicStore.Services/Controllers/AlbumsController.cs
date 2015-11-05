namespace MusicStore.Services.Controllers
{
    using MusicStore.Data;
    using MusicStore.Models;
    using MusicStore.Services.Models;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;

    public class AlbumsController : ApiController
    { 
        private IRepository<Album> albums;

        public AlbumsController()
            : this(new Repository<Album>())
        {
        }

        public AlbumsController(IRepository<Album> albums)
        {
            this.albums = albums;
        }

        [HttpGet]
        public IHttpActionResult All()
        {
            var albums = this.albums.All().Select(a => new AlbumResponseModel
                {
                    Title = a.Title,
                    Producer = a.Producer,
                    Year = a.Year               
                });

            return Ok(albums);
        }

        [HttpPost]
        public IHttpActionResult Create(Album album)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var newAlbum = new Album
            {
               Title = album.Title,
               Year = album.Year,
               Producer = album.Producer
            };

            this.albums.Add(newAlbum);
            this.albums.SaveChanges();

            return Ok(newAlbum);
        }
        
        [HttpPut]
        public IHttpActionResult Update(int id, Album album)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingAlbum = this.albums.All().FirstOrDefault(a => a.Id == id);

            if (existingAlbum == null)
            {
                return BadRequest("Album dos not exist!");
            }

            existingAlbum.Title = album.Title;
            existingAlbum.Year = album.Year;
            existingAlbum.Producer = album.Producer;

            this.albums.SaveChanges();

            return Ok(existingAlbum);
        }

        [HttpDelete]
        public IHttpActionResult Delete(int id)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingAlbum = this.albums.All().FirstOrDefault(a => a.Id == id);

            if (existingAlbum == null)
            {
                return BadRequest("Not exist");
            }

            albums.Delete(existingAlbum);
            this.albums.SaveChanges();

            return Ok(albums);
        }
    }
}
