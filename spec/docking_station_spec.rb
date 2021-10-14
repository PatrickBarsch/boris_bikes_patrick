
require 'docking_station'
require 'bike'

describe DockingStation do 

  it "will recognise 'release_bike'" do
    expect(subject).to respond_to(:release_bike)  
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
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_working

  end
  
  it 'checks that a bike that is put in is properly released again' do
    new_bike = Bike.new
    subject.dock(new_bike)
    expect(subject.release_bike).to be new_bike
  end 

  it 'does not return a bike, when there are none' do
    expect{subject.release_bike}.to raise_error("NoBikeError")
  end

  it 'can store up to default capacity bikes' do 
    expect {DockingStation::DEFAULT_CAPACITY.times do
      subject.dock(Bike.new)
      end}.not_to raise_error
  end

  it 'does not accept any new bikes once capcaity is reached' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
    expect{subject.dock(Bike.new)}.to raise_error("Already at capacity")
  end 

  it 'allows us to set a capacity' do
    capacity = 10
    station = DockingStation.new(capacity)
    expect{capacity.times{station.dock(Bike.new)}}.not_to raise_error
    expect{station.dock(Bike.new)}.to raise_error("Already at capacity")
  end

  it 'does not release a broken bike' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error("NoBikeError")
  end

  it 'finds and releases only working bikes' do
    3.times do |i|
      bike = Bike.new
      bike.report_broken if i.even?
      subject.dock(bike)
    end
    expect(subject.release_bike.working?).to eq true
  end

end
