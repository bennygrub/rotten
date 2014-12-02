class CreateArtistMovies < ActiveRecord::Migration
  def change
    create_table :artist_movies do |t|
      t.integer :artist_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
