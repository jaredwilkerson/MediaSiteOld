class AddLastPlayedColumn < ActiveRecord::Migration
  def self.up
    add_column :movies, :last_played, :timestamp
    add_column :shows, :last_played, :timestamp
  end

  def self.down
    remove_column :movies, :last_played
    remove_column :shows, :lastplayed
  end
end
