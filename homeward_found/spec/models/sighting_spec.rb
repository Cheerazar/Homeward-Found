require 'spec_helper'

describe Sighting do
  it 'returns an event date formatted to long ordinal format' do
    sighting = FactoryGirl.create(:sighting, :event_date => Time.new(2014, 7, 26, 12, 12, 0, "+00:00"))
    expect(sighting.long_date).to eq ("July 26th, 2014 12:12")
  end
end
