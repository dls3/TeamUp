class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])

      # Send a cookie to user's browser
      session[:user_id] = @user.id

      flash[:notice] = 'Play time!'
      redirect_to '/index'
    else
      flash.now[:alert] = 'Login failed - swing again!'
      render :new

    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:alert] = "See you on the court next time around!"
    redirect_to root_url
  end

end
