class User < ApplicationRecord

  has_many :game_events
  has_many :rsvps

end
