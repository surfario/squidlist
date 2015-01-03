class UserConcert < ActiveRecord::Base
  belongs_to :user
  belongs_to :concert

  before_destroy :unfollow_concert

  private

  def unfollow_concert
    UnfollowConcert.create(
      user: self.user, 
      concert: self.concert
    )  
  end  

end