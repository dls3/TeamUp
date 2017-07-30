require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def welcome_email_preview
   UserMailer.welcome_email(User.first)
 end
end
