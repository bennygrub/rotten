json.array!(@movies) do |movie|
  json.extract! movie, :id, :rt_id, :title, :year, :mpaa_rating, :runtime, :critics_consensus, :release_theater, :release_dvd, :critics_rating, :critics_score, :audience_rating, :audience_score, :synopsis, :poster_url, :imdb, :rt_url, :cast_url, :review_url, :similar_url
  json.url movie_url(movie, format: :json)
end
