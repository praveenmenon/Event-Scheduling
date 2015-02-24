class Event < ActiveRecord::Base

	has_many :users,through: :invitees
	has_many :invitees
	belongs_to :user

	validates :event_name,
	:presence =>true,
	:length => {:minimum => 1,:maximum => 30}

	validates :venue,
	:presence =>true,
	:length => {:minimum => 1,:maximum => 30}

	validates :date,
	:presence =>true

	validates :description,
	:presence =>true

	validates :status,
	:presence =>true

def addInvitees(userid,eventid)
	@invitee=Invitee.new()
	userid.each do |u|
		@invitee.user_id= u
		@invitee.event_id=eventid
		@invitee.save
	end
	
end
	
end
