class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :member_name
      t.string :member_email
      t.belongs_to :trip

      t.timestamps null: false
    end
  end
end
