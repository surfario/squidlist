class WelcomeController < ApplicationController
  def index
    @surf_breaks = SurfBreak.all
    @forecasts = Forecast.all
  end

  def about
  end
end
