class CreateUsertrips < ActiveRecord::Migration
  def change
    create_table :usertrips do |t|
      t.belongs_to :trip
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
