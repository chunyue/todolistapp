class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|

      t.timestamps
      t.string :name
      t.date :due_time
      t.text :note
    end
  end
end
