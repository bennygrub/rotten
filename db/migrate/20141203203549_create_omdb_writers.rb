class CreateOmdbWriters < ActiveRecord::Migration
  def change
    create_table :omdb_writers do |t|
      t.integer :writer_id
      t.integer :omdb_movie_id
      t.text :role

      t.timestamps
    end
  end
end
