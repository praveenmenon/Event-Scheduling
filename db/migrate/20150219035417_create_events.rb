class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event
      t.string :venue
      t.date :date
      t.time :time
      t.text :description
      t.string :status
      t.string :user_id

      t.timestamps null: false
    end
  end
end
