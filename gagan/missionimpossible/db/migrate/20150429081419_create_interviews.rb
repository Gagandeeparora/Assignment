class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.references :user, index: true
      t.references :candidate, index: true
      t.datetime "dateandtime"

      t.timestamps null: false
    end
    add_foreign_key :interviews, :users
    add_foreign_key :interviews, :candidates
  end
end
