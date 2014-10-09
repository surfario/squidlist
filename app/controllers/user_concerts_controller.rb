class UserConcertsController < ApplicationController
  def index
    @concerts = Concert.all
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
      redirect_to :action => :index
    end  
  end
end
