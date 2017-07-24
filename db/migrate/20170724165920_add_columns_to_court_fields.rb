class AddColumnsToCourtFields < ActiveRecord::Migration[5.1]
  def change
    add_column :court_fields, :lat, :float
    add_column :court_fields, :long, :float
  end
end
