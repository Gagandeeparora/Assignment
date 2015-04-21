class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :candidates, :users do |t|
    	t.integer :candidate_id
      t.integer :user_id
    end
 
    add_index :candidates_users, :candidate_id
    add_index :candidates_users, :user_id
  end
end
