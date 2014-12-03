class CreateOmdbDirectors < ActiveRecord::Migration
  def change
    create_table :omdb_directors do |t|
      t.integer :director_id
      t.integer :omdb_movie_id

      t.timestamps
    end
  end
end
