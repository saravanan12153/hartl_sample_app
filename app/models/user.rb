class User < ActiveRecord::Base

	# before_save { |user| user.email = user.email.downcase }
	before_save { self.email = email.downcase }

	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
										format: { with: VALID_EMAIL_REGEX }, 
										uniqueness: { case_sensitive: false }
	
	has_secure_password
	
	# no longer need to validate presence of password & password_confirmation?
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
end


