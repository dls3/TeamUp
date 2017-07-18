class GamesController < ApplicationController

  # before_action :require_login, only: [:new, :create]

  def index
    @games = Game.all
    @games = @games.order(:end_date)
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "Game Updated!"
      redirect_to @game
    else
      redirect_back_or_to @game
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:alert] = "Game removed"
    redirect_to root_url
  end

end

  private
  def game_params
    params.require(:game).permit(:date, :time, :sport, :event_name, :players_needed, :current_players)
  end
