class Foursquare < ActiveRecord::Base

  BASE_URL = 'https://api.foursquare.com/v2'

  #attr_reader :category, :neighborhood, :filter

  def initialize(neighborhood, filter)
    @neighborhood = neighborhood
    @filter = filter
  end

  def venue_search_url
    BASE_URL + 'venues/explore?' + {
      client_id: ENV['K33OJJ5HLXU5D4SYCP4OO1BRLWDBT14MK5PSSJGBBNGQOXNC'],
      client_secret: ENV['JPPMLEFTR4LQKGHENCVYDAKZ3VET54VQANHCLR14RNULD3RJ'],
      limit: 50,
      ll: lat_lon,
      radius: 800,
      v: '20130118',
      m: 'swarm',
      verified: true,
      section: @filter,
    }.to_query
  end

  def establish_establishments
    get_establishments.map { |i| i['venue']}
  end

  def get_establishments
    venue = JSON.load(get_establishments_raw.body)
    venue.map {|v| venue['response']['groups'].first['items']}.flatten
  end

  private

  def lat_lon
    coord = @neighborhood.coordinates.sample
    "#{coord.lat}, #{coord.lon}"
  end

  def connect
    Faraday.new(:url => BASE_URL) do |faraday|
      faraday.response :logger #request logs
      faraday.adapter Faraday.default_adapter #make http requests
    end
  end

  def get_establishments_raw
    connect.get venue_search_url
  end

end
