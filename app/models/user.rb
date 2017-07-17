class User < ApplicationRecord

  has_many :game_events
  has_many :rsvps

  validates :name, :email, :password, presence: true

  ALLOWED_ROLES = ["user", "owner"]

end
