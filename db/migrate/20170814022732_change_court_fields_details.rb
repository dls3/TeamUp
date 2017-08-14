class ChangeCourtFieldsDetails < ActiveRecord::Migration[5.1]
  def change
    change_table :court_fields do |t|
      t.rename :lat, :longitude
      t.rename :long, :latitude
    end
  end
end
