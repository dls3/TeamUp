class UserMailer < ApplicationMailer
  default from: 'teamuptoronto@gmail.com'

  def welcome_email(user)
   @user = user
   @url  = 'http://example.com/login'
   mail(to: @user.email, subject: 'Welcome to Team Up!')
 end

 def sample_email(user)
   @user = user
   mail(to: @user.email, subject: 'Sample Email')
 end

end
