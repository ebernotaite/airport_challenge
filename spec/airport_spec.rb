require 'airport.rb'
require 'airplane.rb'

describe Airport do
  let(:airport) {Airport.new}
  let(:airplane) {Airplane.new}
  it 'can instruct plane to take off' do
    airport.planes << airplane 
    airport.instruct_take_off
    expect(airplane.flying).to eq true
  end

  it 'can remove airplane from list of airplanes' do 
    airport.planes << airplane
    airport.instruct_take_off
    expect(airport.planes.count).to eq 0
  end

  #TODO: get around the issue of the return of the method
  # it 'can return the plane that has taken off' do 
  #   airport.planes << airplane
  #   puts airplane
  #   expect(airport.instruct_take_off).to eq airplane
  # end

  it 'can instruct airplane to land' do
    airport.instruct_landing(airplane)
    expect(airport.planes).to eq([airplane])
  end

  it 'can change the plane status of flying to false when the plane lands' do 
    airplane.fly
    airport.instruct_landing(airplane)
    expect(airplane.flying).to eq false
  end
end
