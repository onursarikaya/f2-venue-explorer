class NeighborhoodsController < ApplicationController
  def index
    @area = Neighborhood.find(params[:neighborhood_id])
    filter = params[:filter]
    foursquare = Foursquare.new(@area, filter)
    @establishments = foursquare.establish_establishments
  end

end
