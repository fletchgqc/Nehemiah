class Season < ActiveRecord::Base
	attr_accessible :name
	
	has_many :events
	
	def to_s
		name
	end
end
