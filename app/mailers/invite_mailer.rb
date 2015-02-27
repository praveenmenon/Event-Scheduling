class InviteMailer < ApplicationMailer

 default :from => 'pmenon@qwinixtech.com'

def send_email(invitee,creator)
@invitee = invitee
@creator=creator
binding.pry
    mail( :to => @invitee.email,
    :subject => "#{@invitee.name}, you are invited to a event" )

end
end
