require 'spec_helper'

describe Losting do
  it 'returns an event date formatted to long ordinal format' do
    losting = FactoryGirl.create(:losting, :event_date => Time.new(2014, 8, 12, 2, 2, 0, "+00:00"))
    expect(losting.long_date).to eq("August 12th, 2014 02:02")
  end

  it 'returns a maximum of 10 event dates upon call to ordered_json' do
    15.times { FactoryGirl.create(:losting) }
    expect(JSON.parse(Losting.ordered_json).length).to eq(10)
  end
end
