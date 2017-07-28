class Gamefix < ActiveRecord::Migration[5.1]
  def change
    add_column :rsvps, :game_id, :integer
    remove_column :rsvps, :games_id
  end
end
