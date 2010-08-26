class Show < ActiveRecord::Base
  validates_presence_of :title, :location, :picture, :description
  #validates_numericality_of TODO need to add the date to the show table
  validates_uniqueness_of :title,:location #TODO need to change title to episode title
end
