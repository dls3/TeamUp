class CourtField < ApplicationRecord

  has_many :game_events
  validates :name, :address, :neighbourhood, presence: true

end
