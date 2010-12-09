class Area < ActiveRecord::Base
	attr_accessible :name
	
	has_many :ags
	
	def to_s
		name
	end
end