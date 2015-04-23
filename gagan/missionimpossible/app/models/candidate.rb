class Candidate < ActiveRecord::Base

	has_and_belongs_to_many :users

	validates :name, :email, presence: :true
	validates :phone, presence: :true, numericality: { only_integer: true }
end
