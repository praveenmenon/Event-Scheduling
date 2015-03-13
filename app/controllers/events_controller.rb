class EventsController < ApplicationController
	before_filter :require_login, :except =>[:email_response]

	def new
		@event=Event.new
		respond_to do |format|
			format.js{}
		end
	end

	def show

		@users=User.all
		@event= Event.find(params[:id])
		@invitee=Invitee.where(event_id:@event)
		@participants=@event.selectInvitee(@event.id)
		respond_to do |format|
			format.js{}
		end
	end

	def email_response
		binding.pry
		@invitee = Invitee.find_by_id(params[:id])
		@response = params[:response]
		if @invitee.valid?
			binding.pry
			@invitee.response=@response
			@invitee.save
			binding.pry
			redirect_to root_path,:notice =>" Thank you for RSVP"
		end
	end

	def create
		@event=Event.new(event_params)
		@event.user_id=current_user.id
		if @event.valid? && @event.errors.blank?
			@event.save
			if params["invitees"].present?
				@event.addInvitees(params["invitees"],@event.id,current_user)
			end
			respond_to do |format|
				format.html{
					redirect_to events_path,:notice => "Event Created!"
				}
			end
		else
			redirect_to events_path, :notice => "Event cannot be Created!"
		end
	end

	def index
		@users=User.all
		@events = Event.order("updated_at desc").page(params[:page]).per(5)
		@events.each do|event|
			if event.present?	
				@event=@events.first
				@participants=@event.selectInvitee(@event.id)
				@user=@event.notparticipants(@event.id)
			else
				redirect_to events_path, :notice => "No events"
			end
		end
	end

	def edit
		@users=User.all
		@event= Event.find(params[:id])
		@participants=@event.selectInvitee(@event.id)
		@user=@event.notparticipants(@event.id)
		respond_to do |format|
			format.js{}
		end
	end

	def update
		@event= Event.find(params[:id])
		if @event.valid? && @event.errors.blank?
			binding.pry
			update=@event.check_update(@event,event_params)
			binding.pry
			@event.update(event_params)
			if params["invitees"].present?
				@event.addInvitees(params["invitees"],@event.id,current_user)
			end
			respond_to do |format|
				format.html{
					redirect_to events_path,:notice => "Event Updated!"
				}
			end
		else
			redirect_to events_path, :notice => "Event cannot be Updated!"
		end
	end

	private

	def event_params
		params.require(:event).permit(:event_name, :venue, :date, :time, :description, :status)
	end
end