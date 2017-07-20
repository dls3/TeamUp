class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @users = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome!'
      auto_login(@user)
      redirect_to root_url
    else
      flash.now[:error] = 'You missed, try again!'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
