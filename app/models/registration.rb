class Registration < ActiveRecord::Base
	attr_accessible :name, :comments, :ag_id, :event_id, :sex, :age
	
	belongs_to :event
	belongs_to :ag

	SEX_MALE = 'Male'
	SEX_FEMALE = 'Female'
	SEXES = [SEX_MALE, SEX_FEMALE]

#	AGES = [ ['Adult', 18], [12, 12], [11, 11], [10, 10], [9, 9], [8, 8], [7, 7], 
#		[6, 6], [5, 5], [4, 4], [3, 3], [2, 2], [1, 1], [0, 0] ]
	AGES = { 'Adult' => 18, 12 => 12, 11 => 11, 10 => 10, 9 => 9, 8 => 8,
		7 => 7, 6 => 6, 5 => 5, 4 => 4, 3 => 3, 2 => 2, 1 => 1, 0 => 0 }

	validates :name, :presence => true,
		:length => { :minimum => 4, :maximum => 20 }
	validates :sex, :presence => true,
		:inclusion => { :in => SEXES }
	validates :age, :presence => true,
		:inclusion => { :in => AGES.values }
end