class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :author
      t.text :body
      t.belongs_to :trip

      t.timestamps null: false
    end
  end
end
