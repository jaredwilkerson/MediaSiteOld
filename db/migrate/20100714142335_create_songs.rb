class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.string :artist
      t.string :album
      t.integer :year
      t.string :picture
      t.integer :play_count
      t.timestamp :last_played

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
