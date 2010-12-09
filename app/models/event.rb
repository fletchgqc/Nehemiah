class Event < ActiveRecord::Base
	attr_accessible :location, :year, :season_id
	
	belongs_to :season
	has_many :registrations

	validates :season, :presence => true
end
