class LocationsController < ApplicationController
  def index
    if params[:open_year].present? && params[:sort].present?
      if params[:open_year] == "before 2000"
        if params[:sort] == "ASC"
          @locations = Location.before_2000.sort_asc
        else
          @locations = Location.before_2000.sort_desc
        end
      elsif params[:open_year] == "between 2000 and 2010"
        if params[:sort] == "ASC"
          @locations = Location.between_2000_and_2010.sort_asc
        else
          @locations = Location.between_2000_and_2010.sort_desc
        end
      elsif params[:open_year] == "after 2010"
        if params[:sort] == "ASC"
          @locations = Location.after_2010.sort_asc
        else
          @locations = Location.after_2010.sort_desc
        end
      end
    else
      @locations = Location.all
    end
  end

  def search
    @locations = Location.all
    @locations = @locations.by_open_year(params[:year]) if params[:year].present?
    @locations = @locations.by_size(params[:size]) if params[:size].present?
    @locations = @locations.by_activities_count(params[:activities]) if params[:activities].present?
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
