class GameEvent < ApplicationRecord

  belongs_to :users

  validates :players_needed, presence: true, numericality: true
  validates :current_players, presence: true, numericality: true
  validates :date, :time, :skill, :sport, :event_name, presence: true


end
