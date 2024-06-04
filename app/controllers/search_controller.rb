class SearchController < ApplicationController
  def index
    start_location = params[:location]
    @station_info = NrelFacade.nearest_electric_fuel_station(start_location)
    directions = MapquestFacade.directions(start_location, @station_info.address)
    
    @distance = directions.distance
    @travel_time = directions.travel_time
    @direction_instructions = directions.instructions
 
  end
end