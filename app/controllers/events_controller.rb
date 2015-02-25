class EventsController < ApplicationController
	def new
		@event=Event.new
		respond_to do |format|
			format.js{}
		end
	end

	def show 
		@participant= Event.find(params[:id])
		respond_to do |format|
			format.js{}
		end
	end

	def create
		@event=Event.new(event_params)
		@event.user_id=current_user.id
		if @event.valid? && @event.errors.blank?
			@event.save
			if params["invitees"].present?
			@event.addInvitees(params["invitees"]["u"],@event.id)
			end
			respond_to do |format|
				format.html{
					redirect_to events_index_path,:notice => "Event Created!"
			 	}
				format.js{
					redirect_to events_index_path,:notice => "Event Created!"
				}
			end
		else
			redirect_to events_index_path, :notice => "Event cannot be Created!"
		end
	end

	def index
		@events = Event.limit(5).order('id desc')
		@event=@events.first
	end

	def edit
		@event= Event.find(params[:id])
			respond_to do |format|
			format.js{}
		end
	end

	private
	
	def event_params
		params.require(:event).permit(:event_name, :venue, :date, :time, :description, :status)
	end

end
