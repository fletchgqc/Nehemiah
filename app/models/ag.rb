class Ag < ActiveRecord::Base
	attr_accessible :name, :area_id
	
	belongs_to :area
	has_many :registrations
	
	def to_s
		name
	end
end
