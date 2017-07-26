class RsvpsController < ApplicationController
before_action :game?, only: [:new, :create, :edit, :update]
# before_action :rsvp?, only: [:show, :destroy]

  def index
    @rsvp = Rsvp.all
  end

  def show
    @rsvp = Rsvp.find(params[:rsvp_id])
    render :join
  end

  def new
    @rsvp = Rsvp.new
  end

  def create
    @rsvp = Rsvp.new(rsvp_params)
    @rsvp.user_id = session[:user_id]

    @rsvp.game = @game

    if @rsvp.save
      flash[:notice] = "You have RSVP'd for #{@rsvp.event_name} at #{@rsvp.time}"
      redirect_to profile_path
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
    params.require(:rsvp).permit(:user_id, :game_id)
  end

  def game?
    @game = Game.find(params[:game_id])
  end
