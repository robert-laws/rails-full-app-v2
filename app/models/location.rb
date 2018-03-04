require 'pry'

class Location < ApplicationRecord
  has_many :location_activities, dependent: :destroy
  has_many :activities, through: :location_activities

  accepts_nested_attributes_for :activities

  def self.before_2000
    where("open_year <?", 2000)
  end

  def self.between_2000_and_2010
    where("open_year >=? AND open_year <=?", 2000, 2010)
  end

  def self.after_2010
    where("open_year >?", 2010)
  end

  def self.by_open_year(year)
    where("open_year = ?", year)
  end

  def self.by_size(size)
    where("size = ?", size)
  end

  def self.by_activities_count
    
  end

  def self.sort_asc
    order(open_year: :asc)
  end

  def self.sort_desc
    order(open_year: :desc)
  end

  def self.size_uniq_sort
    select(:size).distinct.order(size: :asc)
  end

  def self.min_value(column)
    minimum(column)
  end

  def self.max_value(column)
    maximum(column)
  end

  def self.number_of_activities
    self.all.collect { |l| l.activities.size }.uniq.sort
  end

  def activities_attributes=(activity_attributes)
    activity_attributes.values.each do |activity_attribute|
      if activity_attribute[:id].present?
        activity = Activity.find_by(id: activity_attribute[:id])
        activity.update(activity_attribute)
      else
        if activity_attribute[:name].present?
          activity = Activity.find_or_create_by(activity_attribute)
          self.activities << activity
        end
      end
    end
  end
end
