class Event < ApplicationRecord
  def self.past
    where("date < ?", DateTime.current)
  end

  def self.upcoming
    where("date >= ?", DateTime.current)
  end

  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee

  belongs_to :creator, class_name: "User"
end
