class UpdateMail < ApplicationMailer

	default :from => 'pmenon@qwinixtech.com'

	def update_event(old_event,new_event)
		@event=old_event
		@date=new_event[:date]
		@time=new_event[:time]
		@description=new_event[:description]
		user_id=Invitee.where(event_id: old_event.id).pluck(:user_id)
		user_id.each do |id|
		@user= User.find(id)
		@invitee=Invitee.where(event_id: @event.id,user_id: @user.id).pluck(:id)
		mail( :to => @user.email,
			:subject => "#{@user.name},the event #{@event.event_name} is edited" )
	end
	end
end
