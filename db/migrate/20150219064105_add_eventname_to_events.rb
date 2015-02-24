class AddEventnameToEvents < ActiveRecord::Migration
  def change

  	rename_column :events, :event, :event_name
  end
end
