require 'spec_helper'

describe Sighting do
  it 'returns an event date formatted to long ordinal format' do
    sighting = FactoryGirl.create(:sighting, :event_date => Time.new(2014, 7, 26, 12, 12, 0, "+00:00"))
    expect(sighting.long_date).to eq ("July 26th, 2014 12:12")
  end

  it 'returns a maximum of 10 event dates upon call to ordered_json' do
    15.times { FactoryGirl.create(:sighting) }
    expect(JSON.parse(Sighting.ordered_json).length).to eq(10)
  end
end
