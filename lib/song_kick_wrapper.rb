class SongKickWrapper
  require 'songkickr'


  # inside rake task
  # User.all.each do |user|
  #   SongKickWrapper.get_results(user.song_kick_user_name) # SongKickWrapper.get_results('surfario')
  # end

  def get_results(user_name)
    user_name ||= 'surfario'

    Rails.logger.info ">>>>> user: #{user_name ||= 'wtf'}"
    # username = user.songkick_name
    remote = Songkickr::Remote.new "#{ENV['SONG_KICK_API_KEY']}"
    Rails.logger.info ">>>> remote: #{remote.inspect}"
    results = remote.users_tracked_events_calendar(user_name)
    Rails.logger.info ">>>>>> results: #{results.inspect}"
    
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