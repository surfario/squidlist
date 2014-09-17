class SongKickWrapper
  # include HTTParty
  require 'songkickr'

  # API_KEY = 'DYk7diydq1KoCzS0'
  # username = 'surfario'

  def get_results
    # username = user.songkick_name
    remote = Songkickr::Remote.new 'DYk7diydq1KoCzS0' 
    results = remote.users_tracked_events_calendar('surfario')
    
    concerts = []
    results.results.each do |r|
      concert = {event: r.event.display_name, venue: r.event.venue.display_name, date: r.event.start}
      concerts << concert  
    end
    
    puts concerts  
  end  

  

  # song = SongKickWrapper.new
  # song.get_concerts

  # def get_concerts
  #   username = 'surfario'
  #   response = HTTParty.get("http://api.songkick.com/api/3.0/users/#{username}/calendar.json?reason=tracked_artist&apikey=#{API_KEY}")  
    
  #   concerts = {concert: response["resultsPage"]["results"]["calendarEntry"]["reason"]["trackedArtist"]}
  # end

end  