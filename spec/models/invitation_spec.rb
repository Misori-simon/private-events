require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it 'Test if invitation is valid' do
    invitor = User.create(name: 'Song')
    invitee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: invitor)
    invitation = Invitation.create(invitee_id: invitee.id, event_id: event.id)
    expect(invitation.valid?).to be true
  end

  it 'Test if invitation without invitee_id and event_id is valid' do
    invitation = Invitation.create
    expect(invitation.valid?).to be false
  end

  it 'Test if invitation without invitee_id valid' do
    invitor = User.create(name: 'Song')
    event = Event.create(description: 'Night Show', date: Time.now, creator: invitor)
    invitation = Invitation.create(event_id: event.id)
    expect(invitation.valid?).to be false
  end

  it 'Test if invitation without event_id is valid' do
    invitee = User.create(name: 'Sung')
    invitation = Invitation.create(invitee_id: invitee.id)
    expect(invitation.valid?).to be false
  end

  it 'Test if user is already invited' do
    invitor = User.create(name: 'Song')
    invitee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: invitor)
    Invitation.create(invitee_id: invitee.id, event_id: event.id)
    invitation2 = Invitation.create(invitee_id: invitee.id, event_id: event.id)
    expect(invitation2.valid?).to be false
  end

  it 'Test if user already belongs to invitees of event' do
    invitor = User.create(name: 'Song')
    invitee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: invitor)
    Invitation.create(invitee_id: invitee.id, event_id: event.id)
    expect(event.invitees.include?(invitee)).to be true
  end

  it 'Test if user has current event in invited events' do
    invitor = User.create(name: 'Song')
    invitee = User.create(name: 'Sung')
    event = Event.create(description: 'Night Show', date: Time.now, creator: invitor)
    Invitation.create(invitee_id: invitee.id, event_id: event.id)
    expect(invitee.invited_events.include?(event)).to be true
  end
end
