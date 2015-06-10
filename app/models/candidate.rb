class Candidate < ActiveRecord::Base

	has_and_belongs_to_many :users
	has_many :uploads, dependent: :destroy
	has_many :interviews, dependent: :destroy

	validates :name, :email, presence: :true
	validates :phone, presence: :true, numericality: { only_integer: true }
end

WillPaginate.per_page = 4