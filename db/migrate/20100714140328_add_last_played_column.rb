class AddLastPlayedColumn < ActiveRecord::Migration
  def self.up
    add_column :movies, :last_played, :timestamp
    add_column :shows, :last_played, :timestamp
  end

  def self.down
    remove column :movies, :last_played
    remove column :shows, :lastplayed
  end
end
