class Concert < ActiveRecord::Base
  belongs_to :artist
  mount_uploader :concertpic, ConcertpicUploader
end
