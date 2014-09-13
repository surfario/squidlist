class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
