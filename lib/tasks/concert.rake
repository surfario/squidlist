task collect_concerts: :environment do 
  song = SongKickWrapper.new
  User.all.each do |user|
    song.get_results(user.songkick_username) 
  end
end  