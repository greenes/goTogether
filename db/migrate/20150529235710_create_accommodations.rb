class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :acc_name
      t.string :acc_location
      t.string :acc_cost
      t.string :acc_link
      t.belongs_to :trip

      t.timestamps null: false
    end
  end
end
