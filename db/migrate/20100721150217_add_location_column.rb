class AddLocationColumn < ActiveRecord::Migration
  def self.up
    add_column :movies, :location, :string
    add_column :shows, :location, :string
    add_column :songs, :location, :string
  end

  def self.down
    remove_column :movies, :location
    remove_column :shows, :location
    remove_column :songs, :location
  end
end
