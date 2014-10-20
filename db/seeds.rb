Concert.destroy_all
SurfBreak.destroy_all
Forecast.destroy_all
Artist.destroy_all
User.destroy_all


SurfBreak.create(
  name: 'Ocean Beach', 
  mslink: 'http://magicseaweed.com/Ocean-Beach-Surf-Report/255/', 
  spot_id: '255'
)

surfbreaks = SurfBreak.all
surfbreaks.each do |surfbreak|
    #get forecasts
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
