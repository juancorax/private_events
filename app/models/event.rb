class Event < ApplicationRecord
  scope :past, -> { where("date < ?", DateTime.current) }
  scope :upcoming, -> { where("date >= ?", DateTime.current) }

  validates :title, length: { in: 5..20 }, presence: true
  validates :body, length: { in: 5..250 }, presence: true
  validates :date, presence: true
  validates :location, length: { in: 5..100 }, presence: true

  has_many :attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee, dependent: :destroy

  belongs_to :creator, class_name: "User"
end
