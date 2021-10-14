
require 'docking_station'
require 'bike'

describe DockingStation do 

  let (:bike) {double(:bike, working?: true)}

  it "will recognise 'release_bike'" do
    expect(subject).to respond_to(:release_bike)  
  end

  it "returns a bike, when release_bike is called" do

    docking_station = DockingStation.new
    new_bike = bike
    docking_station.dock(new_bike)
    expect(docking_station.release_bike).to eq new_bike

  end

  it "returns a bike, which is working" do
    subject.dock(bike)
    expect(subject.release_bike).to be_working

  end
  
  it 'checks that a bike that is put in is properly released again' do
    new_bike = bike
    subject.dock(new_bike)
    expect(subject.release_bike).to be new_bike
  end 

  it 'does not return a bike, when there are none' do
    expect{subject.release_bike}.to raise_error("NoBikeError")
  end

  it 'can store up to default capacity bikes' do 
    expect {DockingStation::DEFAULT_CAPACITY.times do
      subject.dock(bike)
      end}.not_to raise_error
  end

  it 'does not accept any new bikes once capcaity is reached' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect{subject.dock(bike)}.to raise_error("Already at capacity")
  end 

  it 'allows us to set a capacity' do
    capacity = 10
    station = DockingStation.new(capacity)
    expect{capacity.times{station.dock(bike)}}.not_to raise_error
    expect{station.dock(bike)}.to raise_error("Already at capacity")
  end

  it 'does not release a broken bike' do
    bike = double(:bike, working?: false)
    subject.dock(bike)
    expect{subject.release_bike}.to raise_error("NoBikeError")
  end

  it 'finds and releases only working bikes' do
    3.times do |i|
      working = i.even?
      subject.dock(double(:bike, working?: working))
    end
    expect(subject.release_bike.working?).to eq true
  end

end
