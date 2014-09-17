class Concert < ActiveRecord::Base
  mount_uploader :concertpic, ConcertpicUploader
end
