class Activity < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :locations, through: :location_activities
end
