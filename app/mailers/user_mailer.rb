class UserMailer < ApplicationMailer
  default from: 'teamuptoronto@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Team Up!', body: 'Welcome!')
  end


end
