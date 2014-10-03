class UserMailer < ActionMailer::Base
  default from: "ari.olmos@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Squidlist!')
  end  
end
