class Event < ApplicationRecord
  scope :past, -> { where("date < ?", DateTime.current) }
  scope :upcoming, -> { where("date >= ?", DateTime.current) }

  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee

  belongs_to :creator, class_name: "User"
end
