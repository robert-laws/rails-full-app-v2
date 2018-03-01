class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
    @activities = Activity.all
    @activity = @location.activities.build
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    @activities = Activity.all
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location), notice: "Your location was updated successfully"
    else
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:city, :size, :open_year, activity_ids: [], activities_attributes: [:id, :name, :description, :ideal_type, :ideal_size, :energy_usage])
  end
end
