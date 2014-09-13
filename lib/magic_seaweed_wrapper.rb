class MagicSeaweedWrapper
  include HTTParty

  API_KEY = '8yUmsaXT7f2YvJ57cU9bIys2RB1y4t3C'

  # magic = MagicSeaweedWrapper.new
  # magic.get_data

  def get_data  

    SurfBreak.all.each do |surf_break|
      # spot_id = surf_break.spot_id || 255
      spot = 255
      response = HTTParty.get("http://magicseaweed.com/api/#{API_KEY}/forecast/?spot_id=#{spot}")

      forecasts = []
      [3,11,19,27,35].each do |idx|
        forecast = {local_time_stamp: response[idx]["localTimestamp"], solid_rating: response[idx]["solidRating"], max_breaking_height: response[idx]["swell"]["maxBreakingHeight"]}
        forecasts << forecast
      end

      Rails.logger.info ">>>>>>>>>>>>> #{forecasts.inspect}"
      Rails.logger.info ">>>>> First one max_breaking_height: #{forecasts.first[:max_breaking_height]}"

      if forecasts.any? 
        surf_break.forecasts.delete_all  #or destroy_all, can't remember which works better

        forecasts.each_with_index do |forecast, index|
            surf_break.forecasts.create(quality: forecast[:solid_rating], date: Date.today + index) # add the max breaking height
        end 
      end
    end



    # @surf_break
    # forecasts.each_with_index do |forecast, index|
        # @surf_break.forecasts.create(quality: forecast[:solid_rating], date: Date.today + index)
    # end 

    # forecast0 = [response[0]["localTimestamp"], response[0]["solidRating"], response[0]["swell"]["maxBreakingHeight"]]
    # forecast1 = [response[8]["localTimestamp"], response[8]["solidRating"], response[8]["swell"]["maxBreakingHeight"]]
    # forecast2 = [response[16]["localTimestamp"], response[16]["solidRating"], response[16]["swell"]["maxBreakingHeight"]]
    # forecast3 = [response[24]["localTimestamp"], response[24]["solidRating"], response[24]["swell"]["maxBreakingHeight"]]
    # forecast4 = [response[32]["localTimestamp"], response[32]["solidRating"], response[32]["swell"]["maxBreakingHeight"]]


    # p forecast0
    # p forecast1
    # p forecast2
    # p forecast3
    # p forecast4

    # Rails.logger.info "***************** #{response.inspect}"
    # stars = response.first.solidRating
    # Rails.logger.info "***************** #{stars.inspect}"
  end

end