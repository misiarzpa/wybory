class UsdiIdRemove < ActiveRecord::Migration
  def change
  	remove_column :users, :district_id
  	remove_column :districts, :user_id
  end
end
