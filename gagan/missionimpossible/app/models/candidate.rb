class Candidate < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_many :uploads

	validates :name, :email, presence: :true
	validates :phone, presence: :true, numericality: { only_integer: true }
end