class GamesController < ApplicationController

  # before_action :require_login, only: [:new, :create]

  def index
    @games = Game.all
    @games = @games.order(:end_date)

    # search bar
    if params[:search]
      @games = Game.search(params[:search]).order("created_at DESC")
    else
      @games = Game.all.order('created_at DESC')
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @user = User.find_by id: params["user_id"]
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id

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
