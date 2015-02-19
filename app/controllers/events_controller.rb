class EventsController < ApplicationController
	
	def new
		@event=Event.new
	end

	def create
		@event=Event.new(event_params)
		@event.user_id = current_user.id
		if @event.valid? && @event.errors.blank?
			@event.save
			respond_to do |format|
				
				format.html{
					redirect_to events_path,:notice => "Event Created!"
				}
				format.js{
					binding.pry
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

end
