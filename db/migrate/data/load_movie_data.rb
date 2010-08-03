class LoadMovieData < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    Fixtures.create_fixtures(directory, "movies")

  end

  def self.down
    Movie.delete_all
  end
end
