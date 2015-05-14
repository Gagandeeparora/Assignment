class Upload < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "200x200>" }

	do_not_validate_attachment_file_type :avatar
end
