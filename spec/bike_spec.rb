require 'bike'

describe Bike do
  it 'responds to the method working' do
    new_bike = Bike.new
    actual = new_bike.respond_to?(:working?)
    expected = true
    expect(actual).to be expected
  end

end

# Add a test to your bike_spec.rb file that expects Bike instances to respond_to the method working?