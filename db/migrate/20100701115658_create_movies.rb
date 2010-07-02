class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :description
      t.string :picture

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
