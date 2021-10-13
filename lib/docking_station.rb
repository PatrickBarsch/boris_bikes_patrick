class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "NoBikeError" if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def docking(bike)
    raise "Already at capacity" if self.full?
    @docked_bikes.push(bike)
  end 

  private
  
  def full?
    @docked_bikes.count >= DEFAULT_CAPACITY
  end

end 
