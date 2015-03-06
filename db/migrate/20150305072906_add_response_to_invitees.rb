class AddResponseToInvitees < ActiveRecord::Migration
  def change
    add_column :invitees, :response, :string
  end
end
