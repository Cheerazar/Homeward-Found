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

  it 'returns the most recent sighting first' do
    14.times { FactoryGirl.create(:sighting) }
    FactoryGirl.create(:sighting, :event_date => Time.new(2050, 8, 22, 9, 9, 0, "+00:00"))
    first_sighting = JSON.parse(Sighting.ordered_json)[0]
    expect(first_sighting["long_date"]).to eq("August 22nd, 2050 09:09")
  end
end
