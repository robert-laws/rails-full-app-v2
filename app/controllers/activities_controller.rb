class ActivitiesController < ApplicationController
  def index
    if params[:location_id]
      # case of nested url path
      @location = Location.find_by(id: params[:location_id])
      if @location.nil?
        redirect_to activities_path, alert: "Location not found"
      else
        @activities = @location.activities
      end
    else 
      # case of no nested url path
      @activities = Activity.where(nil)
      @activities = @activities.ideal_size(params[:size]) if params[:size].present?
      @activities = @activities.ideal_type(params[:type]) if params[:type].present?
      @activities = @activities.energy_usage(params[:energy]) if params[:energy].present?
    end
  end

  def show
    if params[:location_id]
      # case of nested url path
      @location = Location.find_by(id: params[:location_id])
      @activity = @location.activities.find_by(id: params[:id])
      if @activity.nil?
        redirect_to location_activities_path(@location), alert: "Activity not found"
      end
    else
      @activity = Activity.find(params[:id])
    end
  end
end
