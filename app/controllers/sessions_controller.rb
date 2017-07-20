class SessionsController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.find_by(email: params[:session][:email])
    puts '--------'
    puts (params[:session][:password])

    puts @user
    puts @user.authenticate(params[:session][:password])
    if @user && @user.authenticate(params[:session][:password])

      # Send a cookie to user's browser
      session[:user_id] = @user.id
      puts '-----------'
      puts session[:user_id]

      flash[:notice] = 'Play time!'
      redirect_to root_url
    else
      flash.now[:alert] = 'Login failed - swing again!'
      render :new
      puts '--------'
      puts 'failure'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you on the court next time around!"
    redirect_to root_url
  end

end
