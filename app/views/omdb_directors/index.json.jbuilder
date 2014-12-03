json.array!(@omdb_directors) do |omdb_director|
  json.extract! omdb_director, :id, :director_id, :omdb_movie_id
  json.url omdb_director_url(omdb_director, format: :json)
end
