class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:user_id])
  end

  def showr
      @user = User.find(session[:user_id])
      @games = @user.games
      render :own_games
    end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      mailer = UserMailer.new
      # Tell the UserMailer to send a welcome email after save

      # mailer.welcome_email(@user)
      mailer.welcome_email(@user).deliver
      # format.html { redirect_to(@user, notice: 'User was successfully created.') }
      # format.json { render json: @user, status: :created, location: @user }
      flash[:notice] = 'Welcome!'
      redirect_to '/'
    else
      flash.now[:error] = 'You missed, try again!'
      render 'new'
    end
  end

  def edit
    unless @user
    flash[:error] = "Must be logged in"
    redirect_to root_url and return
  end
end

  def profile
    @user = current_user
  end

  def join
    @user = User.find(session[:user_id])
    render :join
  end




  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
