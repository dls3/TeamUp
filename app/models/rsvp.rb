class Rsvp < ApplicationRecord
  belongs_to :users
  belongs_to :game_events 
end
