task send_email: :environment do 
  User.find_each do |user|
    UserMailer.welcome_email(user).deliver
  end  
end