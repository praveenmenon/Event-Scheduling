class User < ActiveRecord::Base

has_secure_password

validates :name,
	:presence =>true,
	 :format => {:with => /\A[a-zA-Z1-9\-\ \(\)\.+]*\z/i,:message =>"name should be in propper format"}

validates :email,
	:presence =>true,
	:format => {:with =>ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP }

validates :password,
	:presence =>true,
	:length =>{:maximum=> 50, :minimum=> 6},
	:format => {:with =>ConfigCenter::GeneralValidations::PASSWORD_FORMAT_REG_EXP} 	
	

end
