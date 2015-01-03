class UserInterest < ActiveRecord::Base
  belongs_to :user

  after_save :populate_concerts, if: :has_songkick?
  # Will this work for the case when a user edits their songkick id?

  private

  def has_songkick?
    songkick.present?
  end

  def populate_concerts
      
    remote = Songkickr::Remote.new "#{ENV['SONG_KICK_API_KEY']}"    
    results = remote.users_tracked_events_calendar(songkick)
    
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
