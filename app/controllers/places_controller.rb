class PlacesController < ApplicationController

  def index
    @area = neighborhood.find(params[:neighborhood_id])
    filter = params[:filter]
    foursquare = Foursquare.new(@area, filter)
    @establishments = foursquare.establish_establishments
  end

end
