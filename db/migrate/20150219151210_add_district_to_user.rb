class AddDistrictToUser < ActiveRecord::Migration
  def change
    remove_column :districts, :user_id
  end
end
