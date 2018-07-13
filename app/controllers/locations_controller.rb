class LocationsController < ApplicationController
  def index
    @locations = Location.all
      @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=#{Rails.application.credentials.google_api}"
  end

  def new
    @location = Location.new
  end

  def create
    location = Location.new location_params
    location.address = params[:address]
    location.save
    redirect_to location_path(location.id)

  end

  def show
    @location = Location.find params[:id]
  end

  private
  def location_params
    params.require(:location).permit(:address)
  end
end
