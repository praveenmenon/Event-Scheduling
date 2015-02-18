class EventsController < ApplicationController

	def new
		@event=Event.new
	end

	def create
		binding.pry
		@event = Event.new(event_params)
		@event.user_id = session[:user_id]
		binding.pry
		if @event.valid? && @event.errors.blank?
			bindin.pry
			respond_to do |format|
				
				format.html{
					render :partial=>"layouts/event_handler/ticket",:collection => @event, :notice => "Event Created"
				}
				format.js{
					render :partial=>"layouts/event_handler/ticket",:collection => @event, :notice => "Event Created"
				}
				else
					binding.pry
			redirect_to welcome_event_handler_path, :notice => "error!"

		end

	end

	def index
	end

	private

	def event_params
		params.require(:event).permit(:event,:venue,:date,:time,:description,:status)
	end
end
