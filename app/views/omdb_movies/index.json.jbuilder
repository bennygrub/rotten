json.array!(@omdb_movies) do |omdb_movie|
  json.extract! omdb_movie, :id, :imdb, :title, :year, :rated, :released, :runtime, :plot, :language, :country, :awards, :metascore, :imdb_rating, :imdb_votes
  json.url omdb_movie_url(omdb_movie, format: :json)
end
