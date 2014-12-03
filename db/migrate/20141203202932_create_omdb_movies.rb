class CreateOmdbMovies < ActiveRecord::Migration
  def change
    create_table :omdb_movies do |t|
      t.text :imdb
      t.text :title
      t.integer :year
      t.text :rated
      t.datetime :released
      t.integer :runtime
      t.text :plot
      t.text :language
      t.text :country
      t.text :awards
      t.integer :metascore
      t.float :imdb_rating
      t.integer :imdb_votes

      t.timestamps
    end
  end
end
