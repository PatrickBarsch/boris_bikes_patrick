require 'bike'

describe Bike do
  
  it 'works per default' do
    expect(subject).to be_working
  end

  it 'can be reported broken' do 
    subject.report_broken
    expect(subject.broken).to eq true
  end

end