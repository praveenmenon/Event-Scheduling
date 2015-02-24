class User < ActiveRecord::Base

	has_many :events, through: :invitees
	has_many :invitees
	has_secure_password :validations => false


	validates :name,
	:presence =>true,
	:length => {:minimum => 1,:maximum => 50},
	:format => {:with => ConfigCenter::GeneralValidations::NAME_FORMAT_REG_EXP},
	:unless => proc{|u| u.provider.present?}

	validates :email,
	:presence =>true,
	:format => {:with =>ConfigCenter::GeneralValidations::EMAIL_FORMAT_REG_EXP },
	:unless => proc{|u| u.provider.present?}

	validates :password,
	:presence =>true,
	:length => {:minimum => 6 },                       
	:unless => proc{|u| u.provider.present?}

	def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
      user
    else
      nil
    end
  end		

def self.create_with_omniauth(auth)
    create! do |user|
    user.provider = auth["provider"]
    user.uid = auth.uid
    user.name = auth.info.name
    user.save!
    end
  end


end
