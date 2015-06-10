class AddAttachmentAvatarToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :uploads, :avatar
  end
end
