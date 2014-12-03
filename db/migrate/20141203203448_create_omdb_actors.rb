class CreateOmdbActors < ActiveRecord::Migration
  def change
    create_table :omdb_actors do |t|
      t.integer :actor_id
      t.integer :omdb_movie_id

      t.timestamps
    end
  end
end
