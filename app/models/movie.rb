class Movie < ActiveRecord::Base
  validates_presence_of :title, :year, :picture, :location, :description
  validates_numericality_of :year
  validates_uniqueness_of :title, :scope => :year
end
