class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :reservations
  has_many :attendee, through: :reservations, source: :attendee, class_name: "User", dependent: :destroy

  scope :past_events, -> { where('date < ?', Date.today) }
  scope :future_events, -> { where('date > ?', Date.today) }
end
