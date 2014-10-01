class Concert < ActiveRecord::Base
  belongs_to :artist
  has_many :user_concerts
  has_many :users, through: :user_concerts
    mount_uploader :concertpic, ConcertpicUploader
end
