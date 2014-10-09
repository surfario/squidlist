task send_email: :environment do 
  User.find_each do |user|
    UserMailer.weekly_email(user).deliver
  end  
end