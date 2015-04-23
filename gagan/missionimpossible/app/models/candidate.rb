class Candidate < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_attached_file :resume

	validates :name, :email, presence: :true
	validates :phone, presence: :true, numericality: { only_integer: true }
	validates :resume, :attachment_presence => true

end
