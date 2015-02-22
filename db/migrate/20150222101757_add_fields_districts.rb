class AddFieldsDistricts < ActiveRecord::Migration
  def change
  	add_column :districts, :invalid_votes, :integer
  	add_column :districts, :reason, :string
  	add_column :districts, :ballots, :integer
  end
end
