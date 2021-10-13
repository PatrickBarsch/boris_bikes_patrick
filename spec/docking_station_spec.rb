
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
    docking_station.docking(new_bike)
    expected = Bike
    actual = (docking_station.release_bike).class
    expect(actual).to be expected 

  end

  it "returns a bike, which is working" do
    
    docking_station = DockingStation.new
    new_bike = Bike.new 
    docking_station.docking(new_bike)
    new_bike = docking_station.release_bike
    actual = new_bike.working?
    expected = true
    expect(actual).to be expected

  end

  it "adds a bike to the docking station" do
    docking_station = DockingStation.new
    new_bike = Bike.new
    docking_station.docking(new_bike)
    expect(docking_station.docked_bikes.empty?).to eq false

  end
  
  it 'checks if there is a bike docked' do
    docking_station = DockingStation.new
    new_bike = Bike.new
    docking_station.docking(new_bike)
    expect(docking_station.docked_bikes[0]).to be new_bike
  end 

  it 'does not return a bike, when there are none' do
    docking_station = DockingStation.new
    expect{docking_station.release_bike}.to raise_error("NoBikeError")
  end

  it 'can store up to 20 bikes' do 
    expect{20.times{subject.docking(Bike.new)}}.not_to raise_error
  end

  it 'does not accept any new bikes once capcaity is hit (20)' do
    station = DockingStation.new
    expect{21.times{subject.docking(Bike.new)}}.to raise_error("Already at capacity")
  end 

end
