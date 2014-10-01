class UserConcert < ActiveRecord::Base
  belongs_to :user
  belongs_to :concert
end