class Invitation < ApplicationRecord
  validates_uniqueness_of :invitee_id, scope: [:event_id]

  belongs_to :invitee, class_name: 'User'
  belongs_to :event
end
