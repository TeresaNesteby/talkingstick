class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :name
      t.integer :user_id
      t.integer :period

      t.timestamps null: false
    end
  end
end
