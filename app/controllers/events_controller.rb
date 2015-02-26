class EventsController < ApplicationController
	

	def new
		@event=Event.new

		respond_to do |format|
			format.js{}
		end
	end

	def show 
		@users=User.all 
		@event= Event.find(params[:id])
		@participants=@event.selectInvitee(@event.id)
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
		@users=User.all
		@events = Event.order("id desc").page(params[:page]).per(5)
		@event=@events.first
		@participants=@event.selectInvitee(@event.id)
	end

	def edit
		@users=User.all
		@event= Event.find(params[:id])
		@participants=@event.selectInvitee(@event.id)
		respond_to do |format|
			format.js{}
		end
	end
	
	def update
		@event= Event.find(params[:id])
		if @event.valid? 
			@event.update(event_params)
			if params["invitees"].present?
				@event.addInvitees(params["invitees"]["u"],@event.id)
			end
			respond_to do |format|
				format.html{
					redirect_to events_index_path,:notice => "Event Updated!"
				}
				format.js{
					redirect_to events_index_path,:notice => "Event Updated!"
				}
			end
		else
			redirect_to events_index_path, :notice => "Event cannot be Updated!"
		end

	end

	private
	
	def event_params
		params.require(:event).permit(:event_name, :venue, :date, :time, :description, :status)
	end

end
