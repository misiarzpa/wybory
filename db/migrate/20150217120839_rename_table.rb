class RenameTable < ActiveRecord::Migration
  def change
  	rename_table :committee_voivodships, :committees_voivodships
  end
end
