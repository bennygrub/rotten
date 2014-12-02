json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :rt_artist_id
  json.url artist_url(artist, format: :json)
end
