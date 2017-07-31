class AddSportToCourtFields < ActiveRecord::Migration[5.1]
  def change
    add_column :court_fields, :sport, :string
  end
end
