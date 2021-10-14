class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "NoBikeError" if empty?
    @docked_bikes.each_with_index do |bike, index|
      if bike.working?
        return @docked_bikes.delete_at(index)
      end
    end
  end

  def dock(bike)
    raise "Already at capacity" if full?
    @docked_bikes.push(bike)
  end 

  private

  attr_reader :docked_bikes
  
  def full?
    docked_bikes.count >= @capacity
  end

  def empty?
    docked_bikes.filter{|bike| bike.working?}.empty?
  end

end 
