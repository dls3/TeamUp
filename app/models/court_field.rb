class CourtField < ApplicationRecord

  has_many :games
  validates :name, :address, :neighbourhood, presence: true

end
