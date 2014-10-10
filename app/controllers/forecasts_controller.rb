class ForecastsController < ApplicationController
  def index
  end

  def show
    @forecast = @surfbreak.forecasts.find(params[:id])
  end

  def new
  end

  def edit
  end
end
