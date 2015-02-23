class AddInviteeToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :invitee, index: true
    add_foreign_key :events, :invitees
  end
end
