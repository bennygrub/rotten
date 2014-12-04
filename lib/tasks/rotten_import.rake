desc "Import Rotten Tomatoes"
task :rotten_import => :environment do
  require 'net/http'
  require 'json'
    #Ansul n4su6dc9gc8rd7ajp8r47x3j
    #Ben p4a9amhrxdchfyajehnnx3k2
  units = [6092..20000]
  units.each do |unit|      
        title = Title.find(unit)
        name = URI.encode(title.name)
        url = URI.parse("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=p4a9amhrxdchfyajehnnx3k2=#{name}&page_limit=1")
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|http.request(req)}
        j = JSON.parse(res.body)
        begin
          j["movies"].each do |e|
            id = e["id"]
            title = e["title"]
            year = e["year"]
            mpaa_rating = e["mpaa_rating"]
            runtime = e["runtime"]
            critics_consensus = e["critics_consensus"]
            release_theater = e["release_dates"]["theater"].to_date
            release_dvd = e["release_dates"]["dvd"].to_date
            critics_rating = e["ratings"]["critics_rating"]
            critics_score = e["ratings"]["critics_score"]
            audience_rating = e["ratings"]["audience_rating"]
            audience_score = e["ratings"]["audience_score"]
            synopsis = e["synopsis"]
            poster_url = e["posters"]["original"]
            imdb_id = e["alternate_ids"]["imdb"]
            rt_url = e["links"]["alternate"]
            cast_url = e["links"]["cast"]
            review_url = e["links"]["reviews"]
            similar_url = e["links"]["similar"]

            movie = Movie.where(rt_id: id).first_or_create(rt_id: id,title: title,year: year,mpaa_rating: mpaa_rating,runtime: runtime,release_theater: release_theater,release_dvd: release_dvd,critics_consensus: critics_consensus,critics_rating: critics_rating,critics_score: critics_score,audience_rating: audience_rating,audience_score: audience_score,synopsis: synopsis,poster_url: poster_url,imdb: imdb_id,rt_url: rt_url,cast_url: cast_url,review_url: review_url,similar_url: similar_url)

            e["abridged_cast"].each do |act|
              artist = Artist.where(name: act["name"]).first_or_create(name: act["name"], rt_artist_id: act["id"])
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
end

task :import_titles => :environment do
    require 'csv'    
    csv_path = Rails.root.join("public", "users.csv")
    csv_text = File.read(csv_path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Title.create!(row.to_hash)
    end
end

task :omdb_import => :environment do
  require 'net/http'
  require 'json'

  Movie.find_each(:batch_size => 100) do |unit|
    unless unit.id > 4246
        imdb = URI.encode("tt#{unit.imdb}")
        url = URI.parse("http://www.omdbapi.com/?i=#{imdb}&plot=full&r=json")
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|http.request(req)}
        j = JSON.parse(res.body)
        omdb = OmdbMovie.where(title: j["Title"]).first_or_create(imdb: imdb, title: j["Title"], year: j["Year"].to_i, rated: j["Rated"], released: j["Released"], runtime: j["Runtime"].to_i, plot: j["Plot"], poster: j["Poster"], language: j["Language"], country: j["Country"], awards: j["Awards"], metascore: j["Metascore"].to_i, imdb_rating: j["imdbRating"].to_f, imdb_votes: j["imdbVotes"].to_i)
        if !j["Genre"].blank?
            j["Genre"].split(", ").each do |g|
                genre = Genre.where(name: g).first_or_create(name: g)
                OmdbGenre.where("genre_id = ? AND omdb_movie_id = ?", genre.id, omdb.id).first_or_create(genre_id: genre.id, omdb_movie_id: omdb.id)
            end
        end
        if !j["Actors"].blank?
            j["Actors"].split(", ").each do |g|
                actor = Actor.where(name: g).first_or_create(name: g)
                OmdbActor.where("actor_id = ? AND omdb_movie_id = ?", actor.id, omdb.id).first_or_create(actor_id: actor.id, omdb_movie_id: omdb.id)
            end
        end
        if !j["Director"].blank?
            j["Director"].split(", ").each do |g|
                director = Director.where(name: g).first_or_create(name: g)
                OmdbDirector.where("director_id = ? AND omdb_movie_id = ?", director.id, omdb.id).first_or_create(director_id: director.id, omdb_movie_id: omdb.id)
            end
        end
        if !j["Writer"].blank?
            j["Writer"].split(", ").each do |g|
                if g.scan(/\((.*?)\)/).count > 0
                    role = g.scan(/\((.*?)\)/).first.first
                    name = g.scan(/(.*)\(/).first.first.strip
                else
                    name = g
                end
                writer = Writer.where("name = ?", name).first_or_create(name: name)
                OmdbWriter.where("writer_id = ? AND omdb_movie_id = ? AND role = ?", writer.id, omdb.id, role).first_or_create(writer_id: writer.id, omdb_movie_id: omdb.id, role: role)
            end
        end
    end
  end
end