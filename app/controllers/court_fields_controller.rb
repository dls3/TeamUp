class CourtFieldsController < ApplicationController
  require 'csv'

  CSV.foreach('tennis_courts_facilities_data_2017.csv', :headers => true) do |row|
    Moulding.create!(row.to_hash)
  end

end
