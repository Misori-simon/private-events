require 'rails_helper'

RSpec.describe Event do
  it 'Checks validity of event' do
    user = User.create(name: 'Tim')
    event = Event.create(description: 'Night Show', date: Time.now, creator: user)
    expect(event.valid?).to be true
  end

  it 'Checks if event is created by user' do
    user = User.create(name: 'Tim')
    event = Event.create(description: 'Night Show', date: Time.now, creator: user)
    expect(user.events.first).to eql(event)
  end

  it 'Checks validity of event1 without description' do
    user = User.create(name: 'Tim')
    expect(Event.new(description: '', date: Time.now, creator: user).valid?).to be false
  end

  it 'Checks validity of event2 without date' do
    user = User.create(name: 'Tim')
    expect(Event.new(description: 'Night Show', date: '', creator: user).valid?).to be false
  end

  it 'Checks validity of event3 without creator' do
    expect(Event.new(description: 'Night Show', date: Time.now).valid?).to be false
  end
end
