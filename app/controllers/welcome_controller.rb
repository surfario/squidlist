class WelcomeController < ApplicationController
  def index
    @surf_breaks = current_user && current_user.surf_breaks.any? ? current_user.surf_breaks : SurfBreak.all
    @forecasts = @surf_breaks.collect(&:forecasts).flatten
    @concerts = current_user && current_user.concerts.any? ? current_user.concerts : Concert.all
    @artists = Artist.all

    @all_events = @forecasts + @concerts
    @all_events.flatten.sort_by &:date
  end

  def about
  end
end
