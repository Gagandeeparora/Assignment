class User < ActiveRecord::Base
	has_secure_password

	before_save :convert_email_to_downcase

	validates :name, presence: true, length: { maximum: 50 } 

	validates :email, presence: true, length: { maximum: 255 },
						format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, 
						uniqueness: { case_sensitive: false } 

	validates :password, presence: true, length: { minimum: 6 }

	validates :password_confirmation, presence: true

	def convert_email_to_downcase
	  self.email = self.email.downcase
	end

end
