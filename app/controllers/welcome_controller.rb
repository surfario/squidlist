class WelcomeController < ApplicationController
  def index
    @surf_breaks = current_user && current_user.surf_breaks.any? ? current_user.surf_breaks : SurfBreak.all
    @forecasts = @surf_breaks.collect(&:forecasts).flatten
    @concerts = Concert.all
  end

  def about
  end
end
