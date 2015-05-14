require 'role_model'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_role

  has_and_belongs_to_many :candidates
  has_many :interviews
  has_many :uploads

  validates :first_name,:last_name, presence: true

  include RoleModel
  #attr_accessible :roles, :roles_mask
  roles_attribute :roles_mask
  roles :super_admin, :admin, :user

  private

    def set_default_role
    	self.role ||= :user
    end
end

WillPaginate.per_page = 4