class LocationsController < ApplicationController
  def index
      @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=#{Rails.application.credentials.google_api}"
      @latitude = @map_url['results']['location']['lat']
  end

  def new
  end
end
