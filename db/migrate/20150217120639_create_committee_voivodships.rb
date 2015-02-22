class CreateCommitteeVoivodships < ActiveRecord::Migration
  def change
    create_table :committee_voivodships do |t|
      t.integer :committee_id
      t.integer :voivodship_id

      t.timestamps
    end
  end
end
