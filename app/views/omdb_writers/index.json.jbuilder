json.array!(@omdb_writers) do |omdb_writer|
  json.extract! omdb_writer, :id, :writer_id, :omdb_movie_id, :role
  json.url omdb_writer_url(omdb_writer, format: :json)
end
