class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.integer :user_id
      t.integer :student_id
      t.integer :class_id
      t.string :description
      t.boolean :positive

      t.timestamps null: false
    end
  end
end
