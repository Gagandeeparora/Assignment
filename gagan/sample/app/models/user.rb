class User < ActiveRecord::Base
	attr_accessor :remember_token
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

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ?	BCrypt::Engine::MIN_COST: BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)	
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digested, User.digest(remember_token))		
	end
end
