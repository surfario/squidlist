Concert.destroy_all
SurfBreak.destroy_all
Forecast.destroy_all
Artist.destroy_all
User.destroy_all


# Favortie SF/ San Mateo Area break-- Pleasure Point to Bolinas

SurfBreak.create(
  name: 'Ocean Beach', 
  mslink: 'http://magicseaweed.com/Ocean-Beach-Surf-Report/255/', 
  spot_id: '255'
)

SurfBreak.create(
  name: 'Waddell Creek', 
  mslink: 'http://magicseaweed.com/Waddell-Creek-Surf-Report/3742/', 
  spot_id: '3742'
)

SurfBreak.create(
  name: 'Steamer Lane', 
  mslink: 'http://magicseaweed.com/Steamer-Lane-Surf-Report/163/', 
  spot_id: '163'
)

SurfBreak.create(
  name: 'Pacifica', 
  mslink: 'http://magicseaweed.com/Linda-Mar-Pacifica-Surf-Report/819/', 
  spot_id: '819'
)

SurfBreak.create(
  name: 'Bolinas', 
  mslink: 'http://magicseaweed.com/Bolinas-Surf-Report/4221/', 
  spot_id: '4221'
)

SurfBreak.create(
  name: 'Princeton Jetty', 
  mslink: 'http://magicseaweed.com/Princeton-Jetty-Surf-Report/3679/', 
  spot_id: '3679'
)

SurfBreak.create(
  name: 'Pleasure Point', 
  mslink: 'http://magicseaweed.com/Pleasure-Point-Surf-Report/644/', 
  spot_id: '644'
)

SurfBreak.create(
  name: 'Four Mile', 
  mslink: 'http://magicseaweed.com/Four-Mile-Surf-Report/257/', 
  spot_id: '257'
)

# Favorite San Diego Area Surf Breaks

SurfBreak.create(
  name: 'Ocean Beach (SD)', 
  mslink: 'http://magicseaweed.com/Ocean-beach-Surf-Report/4212/', 
  spot_id: '4212'
)

SurfBreak.create(
  name: 'Scripps', 
  mslink: 'http://magicseaweed.com/Scripps-Pier-La-Jolla-Surf-Report/296/', 
  spot_id: '296'
)

SurfBreak.create(
  name: 'Sunset Cliffs', 
  mslink: 'http://magicseaweed.com/Sunset-Cliffs-Surf-Report/4211/', 
  spot_id: '4211'
)

SurfBreak.create(
  name: 'Blacks', 
  mslink: 'http://magicseaweed.com/Torrey-Pines-Blacks-Beach-Surf-Report/295/', 
  spot_id: '295'
)

SurfBreak.create(
  name: 'Windansea', 
  mslink: 'http://magicseaweed.com/Windansea-Beach-Surf-Report/4214/', 
  spot_id: '4214'
)

SurfBreak.create(
  name: 'Trestles', 
  mslink: 'http://magicseaweed.com/Trestles-Surf-Report/291/', 
  spot_id: '291'
)

magic = MagicSeaweedWrapper.new
magic.get_data


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
