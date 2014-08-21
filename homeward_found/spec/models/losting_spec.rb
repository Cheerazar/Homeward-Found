require 'spec_helper'

describe Losting do
  it 'returns an event date formatted to long ordinal format' do
    losting = FactoryGirl.create(:losting)
    losting_date = losting.event_date
    expect(losting.long_date).to eq(losting_date.to_formatted_s(:long_ordinal))
  end
end
