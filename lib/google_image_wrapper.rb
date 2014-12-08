class GoogleImageWrapper
  def get_artist_pic(artist)
    suckr = ImageSuckr::GoogleSuckr.new
    suckr.get_image_url({"q" => "#{artist}"})
    
    #image = MiniMagick::Image.read(suckr.get_image_content)
  end  
end  