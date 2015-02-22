class DistrictsChanges < ActiveRecord::Migration
  def change
  	rename_column :districts, :reason, :blank
  	rename_column :districts, :invalid_votes, :other
  	add_column :districts, :multiple_x, :integer
  end
end
