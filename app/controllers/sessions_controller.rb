class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_to_or_to(root_url, notice: 'Play time!')
    else
      flash.now[:alert] = 'Login failed - swing again!'
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you on the court next time around!"
    redirect_to root_url
  end

end
