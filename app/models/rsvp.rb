class Rsvp < ApplicationRecord
  belongs_to :users
  belongs_to :game_events

  validates :require_login,
  


  def require_login
    unless current_user
      flash[:alert] = ["You must be logged in to RSVP for a game!"]
      redirect_to root_path
    return
    end
  end

end
