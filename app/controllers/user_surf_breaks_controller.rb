class UserSurfBreaksController < ApplicationController
  respond_to :html, :js

  def index
    @surf_breaks = SurfBreak.all
    # @surf_break_locations = SurfBreak_Location.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @surf_break = SurfBreak.find(params[:surf_break_id])
    @surf_break.users << current_user
    if @surf_break.save
      # nothing
    end 
    respond_to do |format|
      format.html { redirect_to :root }
      format.js
    end 
  end

  def destroy
    @user_surf_break = UserSurfBreak.find(params[:id])
    if @user_surf_break.destroy
      redirect_to :root
    else
      #whatever
    end
  end  
end
