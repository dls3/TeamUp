class User < ApplicationRecord

  has_many :games
  has_many :rsvps

  validates :name, presence: true
  validates :email, uniqueness: true
  
  validates :password, length: {minimum: 8}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: create

  ALLOWED_ROLES = ["user", "owner"]

end
