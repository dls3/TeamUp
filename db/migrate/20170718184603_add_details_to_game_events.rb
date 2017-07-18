class AddDetailsToGameEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :game_events, :user_id, :integer
    remove_column :game_events, :field_id, :integer

    add_reference :game_events, :user, foreign_key: true
    add_reference :game_events, :court_fields, foreign_key: true
  end
end
