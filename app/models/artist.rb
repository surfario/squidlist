class Artist < ActiveRecord::Base
  has_many :concerts
    mount_uploader :artistpic, ArtistpicUploader

  after_create :get_artist_pic_link, if: :artistpic_image?

  def artistpic_image_url
    #self.artistpic.blank? ? link : self.artistpic.url  # <img src='#{artistpic_image_url}' />
  end

  private

  def artistpic_image?
    self.artistpic.blank?
  end
  
  def get_artist_pic_link
    suckr = ImageSuckr::GoogleSuckr.new
    self.update(link: suckr.get_image_url({"q" => "#{name}"}))
  end  

end

# Is there a good way to show the artistpic in my views (when it's avialable), otherwise, show the link based image?
