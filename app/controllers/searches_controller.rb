class SearchesController < ApplicationController
  def search_results
    @user = User.find(session[:user_id])
    # @games = @user.games.where(sport:params[:sport])
    # @games = Game.where(sport:params[:sport])
    # @games = Game.where(neighbourhood:params[:neighbourhood])
    # @games.where(['sport' = ? OR 'neighbourhood' = ?, :sport, :neighbourhood])
    # Game.where(sport: '?')

    # @games = Game.where("sport ILIKE ?", "%#{params[:sport]}%")
    # @games = Game.where("neighbourhood ILIKE ?", "%#{params[:neighbourhood]}%")

    # @games = Game.where("sport ILIKE ? OR neighbourhood ILIKE ?", "%#{params[:sport]}%", "%#{params[:neighbourhood]}%")

    sport = "%#{params[:sport]}%"
   sport = "" if params[:sport].empty?
   neighbourhood = "%#{params[:neighbourhood]}%"
   neighbourhood = "" if params[:neighbourhood].empty?
   @games = Game.where("sport ILIKE ? OR neighbourhood ILIKE ?", sport, neighbourhood)

    # filter thrugh the games code

  end

  def search
  end
end
