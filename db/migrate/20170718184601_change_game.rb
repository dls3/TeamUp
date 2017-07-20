class ChangeGame < ActiveRecord::Migration[5.1]
  def change
    rename_table :game_events, :games
    rename_column :rsvps, :game_events_id, :game_id
  end
end
