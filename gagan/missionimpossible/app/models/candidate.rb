class Candidate < ActiveRecord::Base
	validates :name, :email, presence: :true
	validates :phone, presence: :true, numericality: { only_integer: true }
	
end
