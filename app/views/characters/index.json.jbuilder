json.array!(@characters) do |character|
  json.extract! character, :id, :artist_id, :movie_id, :name
  json.url character_url(character, format: :json)
end
