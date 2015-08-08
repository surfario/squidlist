task collect_concerts: :environment do   
  User.all.each do |user| 
    if user.user_interest
      song = SongKickWrapper.new
      song.get_results(user.user_interest.songkick) 
    end
  end
end  