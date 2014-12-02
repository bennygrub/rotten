class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :rt_id
      t.text :title
      t.integer :year
      t.text :mpaa_rating
      t.integer :runtime
      t.text :critics_consensus
      t.datetime :release_theater
      t.datetime :release_dvd
      t.text :critics_rating
      t.integer :critics_score
      t.text :audience_rating
      t.integer :audience_score
      t.text :synopsis
      t.text :poster_url
      t.text :imdb
      t.text :rt_url
      t.text :cast_url
      t.text :review_url
      t.text :similar_url

      t.timestamps
    end
  end
end
