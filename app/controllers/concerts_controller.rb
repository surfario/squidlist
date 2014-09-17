class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end

  def new
  end

  def edit
    @concert = Concert.find(params[:id])
  end

  def show
  end

   def update
    @concert = Concert.find(params[:id])
    if @concert.update_attributes(concert_params)
      redirect_to @concert
    end  
  end

  private 

    def concert_params
      params.require(:concert).permit(:concertpic)
    end
end
