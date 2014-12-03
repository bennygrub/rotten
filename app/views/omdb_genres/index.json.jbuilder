json.array!(@omdb_genres) do |omdb_genre|
  json.extract! omdb_genre, :id, :genre_id, :omdb_movie_id
  json.url omdb_genre_url(omdb_genre, format: :json)
end
