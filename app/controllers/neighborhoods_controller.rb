class NeighborhoodsController < ApplicationController
  def index
    @area = Neighborhood.all
    #find(params[:neighborhood_id])
    filter = params[:filter]
    foursquare = Foursquare.new(@area, filter)
    @establishments = foursquare.establish_establishments
  end

  def show
  @area = Neighborhood.find(params[:id])
  @filters = ['Hotel']
end

end
