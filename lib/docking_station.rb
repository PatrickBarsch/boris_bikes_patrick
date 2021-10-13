class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "NoBikeError" if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    raise "Already at capacity" if full?
    @docked_bikes.push(bike)
  end 

  private

  attr_reader :docked_bikes
  
  def full?
    docked_bikes.count >= capacity
  end

  def empty?
    docked_bikes.empty?
  end

end 
