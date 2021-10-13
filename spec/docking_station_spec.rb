
require 'docking_station'
require 'bike'

describe DockingStation do 

  it "will recognise 'release_bike'" do
    docking_station = DockingStation.new
    actual = docking_station.respond_to?(:release_bike)
    expected = true
    expect(actual).to(eq(expected))
  end

  it "returns a bike, when release_bike is called" do

    docking_station = DockingStation.new
    new_bike = Bike.new 
    docking_station.dock(new_bike)
    expected = Bike
    actual = (docking_station.release_bike).class
    expect(actual).to be expected 

  end

  it "returns a bike, which is working" do
    
    docking_station = DockingStation.new
    new_bike = Bike.new 
    docking_station.dock(new_bike)
    new_bike = docking_station.release_bike
    actual = new_bike.working?
    expected = true
    expect(actual).to be expected

  end
  
  it 'checks if there is a bike docked' do
    docking_station = DockingStation.new
    new_bike = Bike.new
    docking_station.dock(new_bike)
    expect(docking_station.release_bike).to be new_bike
  end 

  it 'does not return a bike, when there are none' do
    expect{subject.release_bike}.to raise_error("NoBikeError")
  end

  it 'can store up to default capacity bikes' do 
    expect {DockingStation::DEFAULT_CAPACITY.times do
      subject.dock(Bike.new)
      end}.not_to raise_error
  end

  it 'does not accept any new bikes once capcaity is hit (20)' do
    subject.capacity.times {subject.dock(Bike.new)}
    expect{subject.dock(Bike.new)}.to raise_error("Already at capacity")
  end 

  it 'allows us to set a capacity' do
    capacity = 10
    station = DockingStation.new(capacity)
    expect(station.capacity).to eq capacity
  end

  it 'has a default capacity of DEFAULT_CAPACITY' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
