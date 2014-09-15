task collect_forecast: :environment do 
  a = MagicSeaweedWrapper.new
  a.get_data
end