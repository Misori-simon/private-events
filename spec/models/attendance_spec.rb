require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it 'Test if attendance is valid' do
    creator = User.create(name: 'Song')
    attendee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    attendance = Attendance.create(attendee_id: attendee.id, event_id: event.id)
    expect(attendance.valid?).to be true
  end

  it 'Test if attendance without attendee_id and event_id is valid' do
    attendance = Attendance.create
    expect(attendance.valid?).to be false
  end

  it 'Test if invitation without attendee_id valid' do
    creator = User.create(name: 'Song')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    attendance = Attendance.create(event_id: event.id)
    expect(attendance.valid?).to be false
  end

  it 'Test if invitation without event_id is valid' do
    attendee = User.create(name: 'Sung')
    attendance = Attendance.create(attendee_id: attendee.id)
    expect(attendance.valid?).to be false
  end

  it 'Test if user is already attending event' do
    creator = User.create(name: 'Song')
    attendee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    Attendance.create(attendee_id: attendee.id, event_id: event.id)
    attendance2 = Attendance.create(attendee_id: attendee.id, event_id: event.id)
    expect(attendance2.valid?).to be false
  end

  it 'Test if user already belongs to attendees of event' do
    creator = User.create(name: 'Song')
    attendee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    Attendance.create(attendee_id: attendee.id, event_id: event.id)
    expect(event.attendees.include?(attendee)).to be true
  end

  it 'Test if user has current event in invited events' do
    creator = User.create(name: 'Song')
    attendee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: creator)
    Attendance.create(attendee_id: attendee.id, event_id: event.id)
    expect(attendee.attended_events.include?(event)).to be true
  end
end
