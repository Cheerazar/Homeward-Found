require 'spec_helper'

describe Losting do
  it 'returns an event date formatted to long ordinal format' do
    losting = FactoryGirl.create(:losting)
    losting_date = losting.event_date
    expect(losting.long_date).to eq(losting_date.to_formatted_s(:long_ordinal))
  end

  it 'returns a maximum of 10 event dates upon call to ordered_json' do
    15.times { FactoryGirl.create(:losting) }
    expect(JSON.parse(Losting.ordered_json).length).to eq(10)
  end
end
