class Upload < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar

	do_not_validate_attachment_file_type :avatar

end
