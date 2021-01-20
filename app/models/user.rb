class User < ApplicationRecord
  validates :name, uniqueness: true

  has_many :events, foreign_key: :creator_id
  has_many :attendance, foreign_key: :attendee_id
  has_many :attended_events, through: :attendance, source: :event

  validates :name, presence: true, length: {minimum: 3, maximum: 30}
end
