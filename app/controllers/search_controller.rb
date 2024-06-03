class SearchController < ApplicationController
  def index
    start_location = params[:location]
    station_info = NrelFacade.nearest_electric_fuel_station(start_location)
    end_location = station_info[:address]
    directions = MapquestFacade.directions(start_location, end_location)

    @station_info = station_info
    @distance = directions[:distance]
    @travel_time = directions[:time]
    @direction_instructions = directions[:instructions]
  end
end