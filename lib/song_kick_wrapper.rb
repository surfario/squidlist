class SongKickWrapper
  include HTTParty

  API_KEY = 'DYk7diydq1KoCzS0'

  # song = SongKickWrapper.new
  # song.get_concerts

  def get_concerts
    username = 'surfario'
    response = HTTParty.get("http://api.songkick.com/api/3.0/users/#{username}/calendar.json?reason=tracked_artist&apikey=#{API_KEY}")  
  end

end  