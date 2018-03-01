require 'pry'

class Location < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :activities, through: :location_activities

  accepts_nested_attributes_for :activities

  def activities_attributes=(activity_attributes)
    activity_attributes.values.each do |activity_attribute|
      if activity_attribute[:id].present?
        activity = Activity.find_by(id: activity_attribute[:id])
        activity.update(activity_attribute)
      else
        activity = Activity.find_or_create_by(activity_attribute)
        self.activities << activity
      end
    end
  end
end
