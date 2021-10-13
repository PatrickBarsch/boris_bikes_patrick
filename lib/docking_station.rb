class DockingStation

  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
    @capacity = 20
  end

  def release_bike
    raise "NoBikeError" if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def docking(bike)
   if @docked_bikes.count == @capacity
    raise "Already at capacity"
   end
    @docked_bikes.push(bike)
  end 
end 
