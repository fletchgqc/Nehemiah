class Registration < ActiveRecord::Base
	attr_accessible :name, :comments, :ag_id, :event_id
	
	belongs_to :event
	belongs_to :ag
	
	validates :name, :presence => true,
		:length => { :minimum => 4, :maximum => 20 }
end