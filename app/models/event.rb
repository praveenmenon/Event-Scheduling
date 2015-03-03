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


	def addInvitees(user_id,event_id)
		user_id.each do |id|
			@invitee = Invitee.new(user_id: id, event_id: event_id)
			@invitee.save
			@user=User.find_by_id(id)
			@event=Event.find_by_id(event_id)
			binding.pry
			InviteMailer.send_email(@user,@event).deliver
		end
	end

	def selectInvitee(event)
		Invitee.where(event_id: event).pluck(:user_id)
	end

	def notparticipants(event1)
		@user=User.all()
		@user.where('id not in (?)',Invitee.where(event_id: event1).pluck(:user_id))
	end
end
