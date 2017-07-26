class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :game
  # validate  :require_login


  #
  # def require_login
  #   unless current_user
  #     flash[:alert] = ["You must be logged in to RSVP for a game!"]
  #     redirect_to root_path
  #   return
  #   end
  # end

  # def rsvp_action
  #   @rsvp = Rsvp.new(params[:game_id],params[:user_id])
  #   @game = Game.find(params[:id])
  #   @user = User.find(params[:id])
  #
  #
  #   rsvp = @rsvp.where(game_id = @game, user_id = @user)
  #   rsvp.players_needed -= 1
  #   rsvp.current_players += 1
  # end

end
