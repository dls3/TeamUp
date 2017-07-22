class Game < ApplicationRecord

  belongs_to :user

  validates :players_needed, presence: true, numericality: true
  validates :current_players, presence: true, numericality: true
  validates :date, :time, :sport, :event_name, presence: true

  # search bar
  def self.search(search)
    where("name LIKE ?", "%#{search}%#")
    where("content LIKE ?","%#{search}%#")
  end

end
