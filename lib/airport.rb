require 'weather'

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed_planes = []
  end

  def land(plane)
    fail "No landings allowed due to bad weather" if stormy?
      
    fail "Airport is full" if full?

    @landed_planes << plane
  end

  def takeoff(plane)
    fail "No take offs allowed due to bad weather" if stormy?

    @landed_planes.delete(plane)
    "#{plane} has left the Airport"
  end

  private
  def full?
    @landed_planes.count >= @capacity
  end

  def stormy?
    Weather.stormy?
  end

end
