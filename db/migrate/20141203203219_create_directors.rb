class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.text :name

      t.timestamps
    end
  end
end
