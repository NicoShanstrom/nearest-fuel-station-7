class MapquestFacade
  def self.directions(start_location, end_location)
    response = MapquestApiService.call_db('/directions/v2/route', {
      from: start_location,
      to: end_location
    })
    Directions.new(response[:route])
  end
end
