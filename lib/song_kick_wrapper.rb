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
    
    if concerts.any?
      Concert.delete_all

      concerts.each_with_index do |concert, index|
        Concert.create(event: concert[:event], venue: concert[:venue], date: concert[:date])
      end
    end   
  end  


end  