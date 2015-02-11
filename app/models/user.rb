class User < ActiveRecord::Base

	has_secure_password

	validates :name,
	:presence =>true,
	:length => {:minimum => 3,:maximum => 50},
	:format => {:with => ConfigCenter::GeneralValidations::NAME_FORMAT_REG_EXP}

	validates :email,
	:presence =>true,
	:format => {:with =>ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP }

	validates :password,
	:presence =>true,
	:length => {:minimum => 6 }
	# :format => {:with =>ConfigCenter::GeneralValidations::PASSWORD_FORMAT_REG_EXP} 		

end
