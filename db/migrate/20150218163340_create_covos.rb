class CreateCovos < ActiveRecord::Migration
  def change
    create_table :covos do |t|
      t.integer :committee_id
      t.integer :voivodship_id

      t.timestamps
    end
  end
end
