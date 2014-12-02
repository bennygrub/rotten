desc "Import Rotten Tomatoes"
task :rotten_import => :environment do
  require 'net/http'
  require 'json'
  units = ["Dark Night", "Toy Story"] 
  units.each do |unit|
    name = URI.encode(unit)
    url = URI.parse("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=p4a9amhrxdchfyajehnnx3k2&q=#{name}&page_limit=1")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|http.request(req)}
    j = JSON.parse(res.body)
    begin
      j["movies"].each do |e|
        d = e["movies"].first
        id = d["id"]
        title = d["title"]
        year = d["year"]
        mpaa_rating = d["mpaa_rating"]
        runtime = d["runtime"]
        critics_consensus = d["critics_consensus"]
        release_theater = d["release_dates"]["theater"].to_date
        release_dvd = d["release_dates"]["dvd"].to_date
        critics_rating = d["ratings"]["critics_rating"]
        critics_score = d["ratings"]["critics_score"]
        audience_rating = d["ratings"]["audience_rating"]
        audience_score = d["ratings"]["audience_score"]
        synopsis = d["synopsis"]
        poster_url = d["posters"]["original"]
        imdb_id = d["alternate_ids"]["imdb"]
        rt_url = d["links"]["alternate"]
        cast_url = d["links"]["cast"]
        review_url = d["links"]["reviews"]
        similar_url = d["links"]["similar"]

        movie = Movie.where(rt_id: rt_id).first_or_create(
            rt_id: id,
            title: title,
            year: year,
            mpaa_rating: mpaa_rating,
            runtime: runtime,
            release_theater: release_theater,
            release_dvd: release_dvd,
            critics_consensus: critics_consensus,
            critics_rating: critics_rating,
            critics_score: critics_score,
            audience_rating: audience_rating,
            audience_score: audience_score,
            synopsis: synopsis,
            poster_url: poster_url,
            imdb: imdb_id,
            rt_url: rt_url,
            cast_url: cast_url,
            review_url: review_url,
            similar_url: similar_url
          )

        d["abridged_cast"].each do |act|
          artist = Artist.where(name: name).first_or_create(name: act["name"], rt_artist_id: act["id"])
          artist_movie = ArtistMovie.where(artist_id: artist.id, movie_id: movie.id).first_or_create(artist_id: artist.id, movie_id: movie.id)
          act["characters"].each do |c|
            character = Character.where(artist_id: artist.id, movie_id: movie.id, name: c).first_or_create(artist_id: artist.id, movie_id: movie.id, name: c)
          end
        end
      end
    rescue

    end
  end
end