task send_email: :environment do 
  if Date.today.monday?
    User.find_each do |user|
      UserMailer.weekly_email(user).deliver
    end
  end    
end

task collect_forecast: :environment do 
  a = MagicSeaweedWrapper.new
  a.get_data
end

task collect_concerts: :environment do   
  User.all.each do |user|
    song = SongKickWrapper.new
    song.get_results(user.user_interest.songkick) 
  end
end  