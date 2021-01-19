class User < ApplicationRecord
  validates :name, uniqueness: true

  has_many :events, :foreign_key => :creator_id
end
