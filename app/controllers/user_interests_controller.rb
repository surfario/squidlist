class UserInterestsController < ApplicationController
  def index
    @user_interest = current_user.user_interest
  end

  def show
    @user_interest = UserInterest.find(params[:id])
  end

  def new
    @user_interest = UserInterest.new
    @user = current_user
  end

  def edit
    @user_interest = UserInterest.find(params[:id])
  end

  def create
    @user_interest = UserInterest.new(user_interest_params)
    @user = current_user
    @user_interest.user = current_user
    Rails.logger.info ">>>> user #{@user.inspect}"
    if @user_interest.save
      render :new
    end    
    Rails.logger.info ">>>> user_interest #{@user_interest}"
  end

  def update
    @user_interest = UserInterest.find(params[:id])
    if @user_interest.update_attributes(user_interest_params)
      flash[:notice] = "Your Interests have been saved"
      redirect_to :root
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :new
    end  
  end

  private

  def user_interest_params
    params.require(:user_interest).permit(:surfing, :concerts, :free_events, :user)
  end  

end