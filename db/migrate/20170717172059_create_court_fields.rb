class CreateCourtFields < ActiveRecord::Migration[5.1]
  def change
    create_table :court_fields do |t|

      t.timestamps
    end
  end
end
