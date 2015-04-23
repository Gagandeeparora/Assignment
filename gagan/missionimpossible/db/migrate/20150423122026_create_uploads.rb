class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :candidate_id

      t.timestamps null: false
    end
  end
end
