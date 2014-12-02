json.array!(@artist_movies) do |artist_movie|
  json.extract! artist_movie, :id, :artist_id, :movie_id
  json.url artist_movie_url(artist_movie, format: :json)
end
