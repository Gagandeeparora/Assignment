require 'role_model'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,:last_name, presence: true

  include RoleModel
  #attr_accessible :roles, :roles_mask
  roles_attribute :roles_mask
  roles :super_admin, :admin, :user

  def set_default_role
  	self.role ||= :user
  end

end
