class UpdateMail < ApplicationMailer

	default :from => 'pmenon@qwinixtech.com'

	def update_event(old_event,new_event)
		@date=new_event[:date]
		@time=new_event[:time]
		@description=new_event[:description]
		old_event.invitee
		mail( :to => @invitee.user.email,
			:subject => "#{@invitee.user.name}, you are invited to a event" )

	end
end
