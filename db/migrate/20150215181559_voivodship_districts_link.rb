class VoivodshipDistrictsLink < ActiveRecord::Migration
  def change
  	add_column :districts, :voivodship_id, :integer
  end
end
