class MapquestFacade
  def self.directions(start_location, end_location)
    response = MapquestApiService.call_db('/directions/v2/route', { 
      from: start_location, 
      to: end_location,
    })
    
    instructions = response[:route][:legs][0][:maneuvers].map do |maneuver|
      maneuver[:narrative]
    end

    {
      distance: response[:route][:distance],
      time: response[:route][:formattedTime],
      instructions: instructions
    }
    # require 'pry'; binding.pry
  end
end
