class CreateUsdis < ActiveRecord::Migration
  def change
    create_table :usdis do |t|
      t.integer :user_id
      t.integer :district_id

      t.timestamps
    end
  end
end
