class SongKickWrapper
  require 'songkickr'


  # inside rake task
  # User.all.each do |user|
  #   SongKickWrapper.get_results(user.song_kick_user_name) # SongKickWrapper.get_results('surfario')
  # end

  def get_results(user_name)
  
  user = UserInterest.find_by_songkick(user_name).user if user_name
    if user

      Rails.logger.info ">>>>> user: #{user_name}"
      
      remote = Songkickr::Remote.new "#{ENV['SONG_KICK_API_KEY']}"    
      Rails.logger.info ">>>> remote: #{remote.inspect}"
      results = remote.users_tracked_events_calendar(user_name)
      Rails.logger.info ">>>>>> results: #{results.inspect}"
      
      concerts = []
      results.results.each do |r|
        concert = {event: r.event.display_name, venue: r.event.venue.display_name, date: r.event.start, artists: r.event.performances.first.artist.display_name, link: r.event.uri}
        # Note: only grabbing 1st artist
        concerts << concert  
      end
      
      if concerts.any?
        concerts.each_with_index do |concert, index|
          c = Concert.find_by_event(concert[:event])
          unless c.present?
            c = Concert.create(event: concert[:event], venue: concert[:venue], date: concert[:date], artists: concert[:artists], link: concert[:link])
          end

          user.concerts << c unless user.concerts.include?(c) || user.unfollow_concerts.pluck(:concert_id).include?(c.id) 

          
          artist = Artist.find_by_name(concert[:artists])
          unless artist.present?
            artist = Artist.create(name: concert[:artists])
          end
        end  

        
      end
    end   

  end  


end  