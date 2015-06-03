class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :author
      t.text :body
      t.belongs_to :trip
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
