class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fname
      t.string :lname
      t.integer :teacher_id
      t.integer :class_id

      t.timestamps null: false
    end
  end
end
