class UserSurfBreaksController < ApplicationController
  def index
    @surf_breaks = SurfBreak.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    surf_break = SurfBreak.find(params[:surf_break_id])
    surf_break.users << current_user
    if surf_break.save
      redirect_to :action => :index
    end    
  end

  def destroy
    @user_surf_break = UserSurfBreak.find(params[:id])
    if @user_surf_break.destroy
      redirect_to root_path
    else
      #whatever
    end
  end  
end