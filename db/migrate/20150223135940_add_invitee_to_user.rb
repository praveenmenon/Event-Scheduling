class AddInviteeToUser < ActiveRecord::Migration
  def change
    add_reference :users, :invitee, index: true
    add_foreign_key :users, :invitees
  end
end
