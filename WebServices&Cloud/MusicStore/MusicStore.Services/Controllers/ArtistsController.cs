namespace MusicStore.Services.Controllers
{
    using MusicStore.Data;
    using MusicStore.Models;
    using MusicStore.Services.Models;
    using System.Linq;
    using System.Web.Http;

    public class ArtistsController : ApiController
    {
        private IRepository<Artist> artists;

        public ArtistsController()
            : this(new Repository<Artist>())
        {
        }

        public ArtistsController(IRepository<Artist> artists)
        {
            this.artists = artists;
        }

        [HttpGet]
        public IHttpActionResult All()
        {
            var artists = this.artists.All().Select(a => new ArtistResponseModel
                {
                    Id = a.Id,
                    Name = a.Name
                });

            return Ok(artists);
        }

        [HttpPost]
        public IHttpActionResult Create(Artist artist)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(this.ModelState);
            }

            var newArtist = new Artist
            {
                Name = artist.Name,
                Country = artist.Country
            };

            this.artists.Add(newArtist);
            this.artists.SaveChanges();

            return Ok(newArtist);
        }

        [HttpPut]
        public IHttpActionResult Update(int id, Artist artist)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingArtist = this.artists.All().FirstOrDefault(a => a.Id == id);

            if (existingArtist == null)
            {
                return BadRequest("Not exist");
            }

            existingArtist.Name = artist.Name;
            this.artists.SaveChanges();

            return Ok(artists);
        }

        [HttpDelete]
        public IHttpActionResult Delete(int id)
        {
            if (!this.ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingArtist = this.artists.All().FirstOrDefault(a => a.Id == id);

            if (existingArtist == null)
            {
                return BadRequest("Not exist");
            }

            artists.Delete(existingArtist);
            this.artists.SaveChanges();

            return Ok(artists);
        }
    }
}