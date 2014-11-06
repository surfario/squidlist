class Artist < ActiveRecord::Base
  has_many :concerts
    mount_uploader :artistpic, ArtistpicUploader

  def artistpic_image
    self.artistpic.blank? ? 'default_concert.jpg' : self.artistpic
  end
end
