class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :artist_id
      t.integer :movie_id
      t.text :name

      t.timestamps
    end
  end
end
