class InviteMailer < ApplicationMailer

	default :from => 'pmenon@qwinixtech.com'

	def send_email(invitee, creator)
		@invitee = invitee
		@creator=creator
		mail( :to => @invitee.user.email,
			:subject => "#{@invitee.user.name}, you are invited to a event" )

	end
end
