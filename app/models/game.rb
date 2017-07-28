class Game < ApplicationRecord

  belongs_to :owner, :class_name => 'User', optional: true
  has_many :rsvps

  validates :players_needed, presence: true, numericality: true
  validates :current_players, presence: true, numericality: true
  validates :date, :time, :sport, :skill, :event_name, presence: true

  # search bar
  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%#")
  #   where("content LIKE ?","%#{search}%#")
  # end

 #search bar
  # def self.search(search)
  #   where('sport LIKE ?' OR 'neighbourhood LIKE ?', "%#{search}%", "%#{search}%")
  # end


end
