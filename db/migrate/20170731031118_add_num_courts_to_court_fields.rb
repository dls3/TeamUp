class AddNumCourtsToCourtFields < ActiveRecord::Migration[5.1]
  def change
    add_column :court_fields, :num_courts, :integer
  end
end
