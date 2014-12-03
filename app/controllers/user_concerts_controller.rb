class UserConcertsController < ApplicationController
  respond_to :html, :js

  def index
    #@concerts = Concert.all
    @concerts = []
    today = Date.today
    @concerts = Concert.select { |concert| concert.date >= today }
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    concert = Concert.find(params[:concert_id])
    concert.users << current_user
    if concert.save
      redirect_to :action => :index
    end 
  end

  def destroy
    @user_concert = UserConcert.find(params[:id])
    if @user_concert.destroy
      flash[:notice] = "Your concert was removed."
    end  
    
    respond_with(@user_concert) do |format|
      format.html { redirect_to @user_concert }
    end  

  end
end
