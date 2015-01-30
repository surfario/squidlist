class WelcomeController < ApplicationController
  def index

    @surf_breaks, @forecasts, @concerts = [], [], []
    if current_user && current_user.user_interest
        @surf_breaks = current_user.surf_breaks if current_user.user_interest.surfing?
        @forecasts = @surf_breaks.collect(&:forecasts).flatten
        today = Date.today
        #Rails.logger.info ">>>> today: #{today.inspect}"
        #Rails.logger.info ">>>>> User interests: #{current_user.user_interest.inspect}"
        @concerts = current_user.concerts.select { |concert| concert.date >= today && concert.date < (today + 7.days)} if current_user.user_interest.concerts? 
    else
        @surf_breaks = SurfBreak.select { |surf| surf.surf_break_location_id = 1}
        @forecasts = @surf_breaks.collect(&:forecasts).flatten
        today = Date.today
        #Rails.logger.info ">>>> today: #{today.inspect}"
        #Rails.logger.info ">>>>> User interests: #{current_user.user_interest.inspect}"
        @concerts = Concert.select { |concert| concert.date >= today && concert.date < (today + 7.days)}

        #Rails.logger.info ">>>>>> concerts: #{@concerts.inspect}"
    end
    @artists = Artist.all

    @all_events = @forecasts + @concerts 
    @all_events.flatten.sort_by &:date if @all_events.any?
  end

  def next
    @surf_breaks = current_user && current_user.surf_breaks.any? ? current_user.surf_breaks : SurfBreak.all
    @forecasts = @surf_breaks.collect(&:forecasts).flatten
    concerts = current_user && current_user.concerts.any? ? current_user.concerts : Concert.all
    today = Date.today
    #Rails.logger.info ">>>> today: #{today.inspect}"
    #Rails.logger.info ">>>>> concerts: #{concerts.inspect}"
    @concerts = concerts.select { |concert| concert.date >= today && concert.date < (today + 30.days)}
    #Rails.logger.info ">>>>>> concerts: #{@concerts.inspect}"
    @artists = Artist.all

    @all_events = @forecasts + @concerts
    @all_events.flatten.sort_by &:date
  end
end
