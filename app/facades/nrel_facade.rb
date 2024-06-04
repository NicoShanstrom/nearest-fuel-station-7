class NrelFacade
  def self.nearest_electric_fuel_station(start_location)
    response = NrelApiService.call_db('/api/alt-fuel-stations/v1/nearest', {
      location: start_location,
      fuel_type: 'ELEC',
      limit: 1
    })
    
    station_data = response[:fuel_stations]&.first
    Station.new(station_data) if station_data
  end
end
