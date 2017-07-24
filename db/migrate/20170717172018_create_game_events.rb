class CreateGameEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.datetime :date
      t.datetime :time
      t.integer :user_id
      t.integer :field_id
      t.string :skill
      t.string :event_name
      t.string :sport
      t.integer :players_needed
      t.integer :current_players

      t.timestamps
    end
  end
end
