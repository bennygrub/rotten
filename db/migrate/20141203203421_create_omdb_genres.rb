class CreateOmdbGenres < ActiveRecord::Migration
  def change
    create_table :omdb_genres do |t|
      t.integer :genre_id
      t.integer :omdb_movie_id

      t.timestamps
    end
  end
end
