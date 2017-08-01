class SearchesController < ApplicationController
  def search_results
    @user = User.find(session[:user_id])
    # @games = @user.games.where(sport:params[:sport])
    # @games.where(['sport' = ? OR 'neighbourhood' = ?, :sport, :neighbourhood])
    # Game.where(sport: '?')

    @games = Game.where("sport ILIKE ?", "%#{params[:sport]}%") 
    @games = Game.where("neighbourhood ILIKE ?", "%#{params[:neighbourhood]}%")
    # filter thrugh the games code

  end

  def search
  end
end
