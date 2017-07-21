class CourtField < ApplicationRecord

  has_many :games
  validates :name, :address, :neighbourhood, presence: true

# https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyDpZWSriktrzfz64A9G6mcem3mYHuIJqpM


end
