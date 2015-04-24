class Upload < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>"}, 
										:default_url => "/home/letsgomo/Desktop/work/login_page.png"

	do_not_validate_attachment_file_type :avatar

end
