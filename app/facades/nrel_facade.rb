class NrelFacade
  def self.nearest_electric_fuel_station(location)
    response = NrelApiService.call_db('/api/alt-fuel-stations/v1/nearest', { location: location, fuel_type: 'ELEC', limit: 1 })
    station = response[:fuel_stations][0]
    {
      name: station[:station_name],
      address: "#{station[:street_address]}, #{station[:city]}, #{station[:state]} #{station[:zip]}",
      fuel_type: station[:fuel_type_code],
      access_times: station[:access_days_time]
    }
  end
end
