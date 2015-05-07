class AddCommentToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :comment, :text
  end
end
