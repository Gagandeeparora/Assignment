require 'role_model'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include RoleModel
  #attr_accessible :roles, :roles_mask
  roles_attribute :roles_mask
  roles :super_admin, :admin, :user

end
