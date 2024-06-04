class Directions
  attr_reader :distance, :travel_time, :instructions

  def initialize(data)
    @distance = data[:distance]
    @travel_time = data[:formattedTime]
    @instructions = data[:legs][0][:maneuvers].map { |maneuver| maneuver[:narrative] }
  end
end