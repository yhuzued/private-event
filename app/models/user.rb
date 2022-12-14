class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :creators, foreign_key: :creator_id, class_name: "Event"
  has_many :reservations
  has_many :events
  has_many :attendee, foreign_key: :user_id, class_name: "Event"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
