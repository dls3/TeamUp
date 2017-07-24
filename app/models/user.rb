class User < ApplicationRecord

  has_secure_password


  has_many :games
  has_many :rsvps
  has_many :owned_games, class_name: "Game", foreign_key: "owner_id"

  validates :email, uniqueness: true

  validates :password, length: {minimum: 8}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: create

  ALLOWED_ROLES = ["user", "owner"]

end
