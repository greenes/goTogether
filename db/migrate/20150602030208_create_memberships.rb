class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user
      t.belongs_to :trip
      t.boolean :pending

      t.timestamps null: false
    end
  end
end
