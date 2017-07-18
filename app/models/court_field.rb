class CourtField < ApplicationRecord

  has_many :game_events
  validates :name, :address, :neighbourhood, presence: true

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|    # line by line

    tennis_courts_hash = row.to_hash # exclude the price field
    tennis_courts = CourtField.where(id: tennis_courts_hash["id"])

    CourtField.create!(tennis_courts_hash)
    end
  end

end


# at once
# tennis_courts = CSV.read('tennis_courts_facilities_data_2017.csv)'

# line by line


# CSV.foreach('tennis_courts_facilities_data_2017.csv', :headers => true) do |row|
#   Moulding.create!(row.to_hash)
# end
