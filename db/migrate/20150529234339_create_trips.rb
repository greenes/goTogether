class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.string :trip_location
      t.string :trip_dates

      t.timestamps null: false
    end
  end
end
