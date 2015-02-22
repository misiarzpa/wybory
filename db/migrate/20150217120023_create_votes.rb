class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :number
      t.integer :district_id
      t.integer :committee_id

      t.timestamps
    end
  end
end
