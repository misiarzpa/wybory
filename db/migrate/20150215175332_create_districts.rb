class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :valid_votes
      t.integer :voters
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
