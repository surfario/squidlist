class SongKickWrapper
  require 'songkickr'


  # inside rake task
  # User.all.each do |user|
  #   SongKickWrapper.get_results(user.song_kick_user_name) # SongKickWrapper.get_results('surfario')
  # end

  def get_results(user_name)
    user = User.find_by_songkick_username(user_name)
    if user

      # Rails.logger.info ">>>>> user: #{user_name ||= 'wtf'}"
      remote = Songkickr::Remote.new "#{ENV['SONG_KICK_API_KEY']}"
      # Rails.logger.info ">>>> remote: #{remote.inspect}"
      results = remote.users_tracked_events_calendar(user_name)
      # Rails.logger.info ">>>>>> results: #{results.inspect}"
      
      concerts = []
      results.results.each do |r|
        concert = {event: r.event.display_name, venue: r.event.venue.display_name, date: r.event.start, artists: r.event.performances.first.artist.display_name}
        # ** Need to grab all artists! **
        concerts << concert  
      end
      
      if concerts.any?
        Concert.delete_all

        concerts.each_with_index do |concert, index|
          concert = Concert.create(event: concert[:event], venue: concert[:venue], date: concert[:date], artists: concert[:artists])
        

        # concerts.each_with_index do |concert, index|
        #   concert = Concert.find_by_event(concert[:event])
        #   unless concert.present? 
        #     concert = Concert.create(event: concert[:event], venue: concert[:venue], date: concert[:date])
        #   end
          
          artist = Artist.find_by_name(concert[:artists])
          unless artist.present?
            artist = Artist.create(name: concert[:artists])
          end
        end  

          # user.concerts <<  concert unless user.concerts.include?(concert)
        
      end
    end   

  end  


end  