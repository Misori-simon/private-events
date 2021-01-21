require "spec_helper"

class EventTest < ActiveSupport::TestCase
  RSpec.describe EventTest do
    let(:user) { User.create(name: 'Tim') }
    let(:event) { Event.create(description: 'Night Show', date: Time.now, creator: user) }
    let(:event1) { Event.create(description: '', date: Time.now, creator: user) }
    let(:event2) { Event.create(description: 'Night Show', date: '', creator: user) }
    let(:event3) { Event.create(description: 'Night Show', date: Time.now, creator: '') }

    it 'Checks validity of event' do
      expect(event.valid?).to be true
    end

    it 'Checks validity of event1' do
      expect(event1.valid?).to be false
    end

    it 'Checks validity of event2' do
      expect(event2.valid?).to be false
    end

    it 'Checks validity of event3' do
      expect(event3.valid?).to be false
    end
  end
end
