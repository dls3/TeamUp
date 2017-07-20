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
      mailer = UserMailer.new
      # Tell the UserMailer to send a welcome email after save
      # mailer.welcome_email(@user)
      mailer.welcome_email(@user)
      format.html { redirect_to(@user, notice: 'User was successfully created.') }
      format.json { render json: @user, status: :created, location: @user }
      flash[:notice] = 'Welcome!'
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
