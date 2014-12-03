desc "Import Rotten Tomatoes"
task :rotten_import => :environment do
  require 'net/http'
  require 'json'
  Title.find_each(:batch_size => 10000) do |unit|
    name = URI.encode(unit.name)
    url = URI.parse("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=p4a9amhrxdchfyajehnnx3k2&q=#{name}&page_limit=1")
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

        d["abridged_cast"].each do |act|
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

task :import_titles => :environment do
    require 'csv'    
    csv_path = Rails.root.join("public", "users.csv")
    csv_text = File.read(csv_path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Title.create!(row.to_hash)
    end
end