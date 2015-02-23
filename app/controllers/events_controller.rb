class EventsController < ApplicationController

	before_create :event_invites
	
	def new
		@event=Event.new
		respond_to do |format|
			format.js{}
		end

	end

	def create
		@event=Event.new(event_params)
		@event.invitees(user)
		@event.save if @event.valid? && @event.errors.blank?
			respond_to do |format|
				format.html{
					redirect_to events_path,:notice => "Event Created!"
			 	}
				format.js{
					redirect_to events_path,:notice => "Event Created!"
				}
			end
		else
			redirect_to welcome_event_handler_path, :notice => "Event cannot be Created!"
		end
	end

	def index
		@events = Event.limit(5).order('id desc')
	end

	private
	
	def event_params
		params.require(:event).permit(:event_name, :venue, :date, :time, :description, :status)
	end

	def event_invites
		@invitees=Event.where("event_id = ? AND user_id = ?", event.id, user.id)
	end

end
