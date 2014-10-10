module UserConcertsHelper
   def get_user_concert_for(concert_id)
    Rails.logger.info(">>>>>> #{concert_id.inspect}")
    current_user.user_concerts.where(concert_id: concert_id).first
  end
end
