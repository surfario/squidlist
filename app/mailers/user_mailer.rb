class UserMailer < ActionMailer::Base
  default from: "ari.olmos@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://squidlist.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Squidlist!')
  end  

  def weekly_email(user)
    @surf_breaks = user.surf_breaks 
    @forecasts = @surf_breaks.collect(&:forecasts).flatten
    concerts = user.concerts 
    today = Date.today
    @concerts = concerts.select { |concert| concert.date >= today && concert.date < (today + 7.days)}
    @artists = Artist.all

    @user = user
    @url = 'http://squidlist.herokuapp.com/'
    mail(to: @user.email, subject: 'Your Squidlist Events for the week')
  end  
end
