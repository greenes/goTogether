class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :act_name
      t.string :act_location
      t.string :act_cost
      t.string :link
      t.belongs_to :trip

      t.timestamps null: false
    end
  end
end
