class RsvpsController < ApplicationController
# before_action :game?, only: [:new, :create, :edit, :update]
# before_action :rsvp?, only: [:show, :destroy]

  def index
    @rsvp = Rsvp.all
  end

  # def show
  #   @rsvp = Rsvp.find(params[:id])
  # end

  def new
    @rsvp = Rsvp.new
  end

  def create
    @game = Game.find(params[:game_id])
    @rsvp = Rsvp.new(user_id: params[:user_id], game_id: params[:game_id])
    #@games = Game.where(user_id:params[:user_id], game_id: params[:game_id])
    @rsvps = Rsvp.where(user_id: params[:user_id])
  

     # Empty array
     # Iterate through rsvps
     # Get their game ID
     # Find the game object using the ID and then push that into the empty games array

    if @rsvp.save
      flash[:notice] = "You have RSVP'd for #{@game.event_name} at #{@game.time}"
      render :join
    end
  end

  def destroy
    @rsvp.destroy
    flash[:notice] = "Your RSVP has been successfully cancelled"
    redirect_to profile_path
  end
end

private

  def rsvp_params
    params.require(:rsvps).permit(:user_id, :game_id)
  end
  #
  # def game?
  #   @game = Game.find(params[:game_id])
  # end
