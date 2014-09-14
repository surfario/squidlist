class SurfBreaksController < ApplicationController
  # before_action :set_surf_break

  def index
    @surf_breaks = SurfBreak.all
    @forecasts = Forecast.all

    # @surf_break = SurfBreak.find(params[:id])
    # @forecasts = @surf_break.forecasts
  end

  def show
     @surf_break = SurfBreak.find(params[:id])
     @forecasts = @surf_break.forecasts
  end

  def new
  end

  def edit
    @surf_break = SurfBreak.find(params[:id])
  end

  def update
    @surf_break = SurfBreak.find(params[:id])
    if @surf_break.update_attributes(surf_break_params)
      redirect_to @surf_break
    end  
  end
    

  private

    # def set_surf_break
    #   @surf_break = SurfBreak.find(params[:id])
    #   @forecasts = @surf_breaks.forecasts
    # end  

    def surf_break_params
      params.require(:surf_break).permit(:surfpic)
    end
    
end
