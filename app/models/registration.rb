class Registration < ActiveRecord::Base
	attr_accessible :name, :comments, :ag_id, :event_id, :sex, :age
	
	belongs_to :event
	belongs_to :ag

	SEX_MALE = 'Male'
	SEX_FEMALE = 'Female'
	SEXES = [SEX_MALE, SEX_FEMALE]

	AGES = [ ['Adult', 18], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
		[8, 8], [9, 9], [10, 10], [11, 11], [12, 12] ]
	
	validates :name, :presence => true,
		:length => { :minimum => 4, :maximum => 20 }
	validates :sex, :presence => true,
		:inclusion => { :in => SEXES }
	validates :age, :presence => true
end