class Song < ActiveRecord::Base
  validates_presence_of :title, :genre, :artist, :album
  #validates_numericality_of
  validates_uniqueness_of :title
end
