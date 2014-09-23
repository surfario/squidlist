class ArtistsController < ApplicationController
  def index
    @artists = Artist.all 
  end

  def new
  end

  def edit
    @artist = Artist.find(params[:id])
    @concerts = @artist.concerts
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(artist_params)
      redirect_to @artist
    end  
  end

  private

    def artist_params
      params.require(:artist).permit(:name, :artistpic)
    end  

end
