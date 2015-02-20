class CreateInvitees < ActiveRecord::Migration
  def change
    create_table :invitees do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :invitees, :users
    add_foreign_key :invitees, :events
  end
end
