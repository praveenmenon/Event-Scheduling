class Event < ActiveRecord::Base

	has_many :users

	validates :event_name,
	:presence =>true,
	:length => {:minimum => 1,:maximum => 30},

	validates :venue,
	:presence =>true,
	:length => {:minimum => 1,:maximum => 30},

	
end
