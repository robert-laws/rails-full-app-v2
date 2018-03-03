class Activity < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :locations, through: :location_activities

  # scope :ideal_size, ->(size) { where("ideal_size = ?", size) }
  # scope :ideal_type, ->(type) { where("ideal_type = ?", type) }

  def self.ideal_type(ideal_type)
    where("ideal_type = ?", ideal_type)
  end

  def self.ideal_size(ideal_size)
    where("ideal_size = ?", ideal_size)
  end
  
  def self.energy_usage(energy_usage)
    where("energy_usage = ?", energy_usage)
  end
end
