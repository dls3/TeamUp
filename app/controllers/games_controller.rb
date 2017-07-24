class GamesController < ApplicationController
  attr_accessor :date, :time, :players_needed, :current_players, :description, :skill
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
end



  def show
    @game = Game.find(params[:id])
  end


  def new
    @game = Game.new
    @user = User.find_by id: params["user_id"]
  end


  def game_params
    params.required(:game).permit(:date, :time, :sport, :current_players, :players_needed, :event_name, :skill, :description)
  end

  def create
    @game = Game.new(game_params)
    # @game.user_id = session[:user_id]
    @game.user_id = current_user.id

    if @game.save
      # redirect_to game_path(params[:game_id])
      redirect_to game_url(@game)
    else
      render :new
    end
  end


  def edit
    @game = Game.find(params[:id])

    if current_user.id == @game.user_id
      render :edit_event
    else
      flash[:alert] = 'Please login in order to edit this game'
      redirect_to root_path
    end
  end


  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      flash[:notice] = "Game Updated!"
      redirect_to game_url(@game)
    else
      # redirect_back_or_to @game
      render :edit_event
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
    params.require(:game).permit(:date, :time, :skill, :sport, :event_name, :players_needed, :current_players)
  end
