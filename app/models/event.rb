class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :attendance, foreign_key: :event_id
  has_many :attendees, through: :attendance, source: :attendee
  has_many :invitation, foreign_key: :event_id
  has_many :invitees, through: :invitation, source: :invitee

  validates :description, presence: true
  validates :date, presence: true
  validates :creator, presence: true
  scope :past_events, -> {where("date < ?", Time.now)}
  scope :upcoming_events, -> {where("date >= ?", Time.now)}
end
