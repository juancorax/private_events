class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendances, source: :attended_event, dependent: :destroy

  has_many :created_events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy
end
