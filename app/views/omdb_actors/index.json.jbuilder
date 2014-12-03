json.array!(@omdb_actors) do |omdb_actor|
  json.extract! omdb_actor, :id, :actor_id, :omdb_movie_id
  json.url omdb_actor_url(omdb_actor, format: :json)
end
