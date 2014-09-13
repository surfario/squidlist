class MagicSeaweedWrapper
  include HTTParty

  API_KEY = '8yUmsaXT7f2YvJ57cU9bIys2RB1y4t3C'

  # magic = MagicSeaweedWrapper.new
  # magic.get_data

  def get_data  

    SurfBreak.all.each do |surf_break|
      spot_id = surf_break.spot_id 
      response = HTTParty.get("http://magicseaweed.com/api/#{API_KEY}/forecast/?spot_id=#{spot_id}")

      forecasts = []
      [3,11,19,27,35].each do |idx|
        forecast = {local_time_stamp: response[idx]["localTimestamp"], solid_rating: response[idx]["solidRating"], max_breaking_height: response[idx]["swell"]["maxBreakingHeight"]}
        forecasts << forecast
      end

      Rails.logger.info ">>>>>>>>>>>>> #{forecasts.inspect}"
      Rails.logger.info ">>>>> First one max_breaking_height: #{forecasts.first[:max_breaking_height]}"

      if forecasts.any? 
        surf_break.forecasts.destroy_all  #or destroy_all, can't remember which works better

        forecasts.each_with_index do |forecast, index|
            surf_break.forecasts.create(quality: forecast[:solid_rating], height: forecast[:max_breaking_height], date: Date.today + index) # add the max breaking height
        end 
      end
    end



    # Rails.logger.info "***************** #{response.inspect}"
    # stars = response.first.solidRating
    # Rails.logger.info "***************** #{stars.inspect}"
  end

end