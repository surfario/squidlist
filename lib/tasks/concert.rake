task collect_concerts: :environment do   
  User.all.each do |user|
    song = SongKickWrapper.new
    #song.get_results(user.songkick_username) 
    song.get_results(user.user_interest.songkick) 
  end
end  