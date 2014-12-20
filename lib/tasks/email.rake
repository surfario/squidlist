task send_email: :environment do 
  if Date.today.monday?
    User.find_each do |user|
      UserMailer.weekly_email(user).deliver
    end
  end    
end