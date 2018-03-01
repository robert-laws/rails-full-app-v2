class Location < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :activities, through: :location_activities
end
