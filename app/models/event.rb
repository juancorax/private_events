class Event < ApplicationRecord
  scope :past, -> { where("date < ?", DateTime.current) }
  scope :upcoming, -> { where("date >= ?", DateTime.current) }

  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee, dependent: :destroy

  belongs_to :creator, class_name: "User"
end
