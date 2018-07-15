class LocationsController < ApplicationController
  def index
    @locations = Location.all

  end

  def new
    @location = Location.new

  end

  def create
    location = Location.new location_params
    location.save
    redirect_to location_path(location.id)

  end

  def show
    @location = Location.find params[:id]
    Rails.application.credentials.google_api
    #retrieving longitude and latitude based on user input. reaches out to geocoder api for coordinates
    # @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@location.address}&key=#{Rails.application.credentials.google_api}"

    results = Geocoder.search("#{@location.address}")
    coordinates= results.first.coordinates #[latitude, longitude]
    @location.latitude = coordinates.first
    @location.longitude = coordinates.last
    #image for location address call to flickr api
    image_url_id = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{Rails.application.credentials.flickr_api}&per_page=10&format=json&nojsoncallback=1&text=#{@location.address}&tags=cityscape,night&sort=interestingness-desc"
    image_info = HTTParty.get image_url_id
    image_id = image_info['photos']['photo'].first['id']
    image_url = "https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=ca370d51a054836007519a00ff4ce59e&photo_id=#{image_id}&format=json&nojsoncallback=1"
    image_url_info = HTTParty.get image_url
    @location.image = image_url_info['sizes']['size'][4]['source']

    @client = GooglePlaces::Client.new("#{Rails.application.credentials.google_api}")
    @spots = @client.spots(@location.latitude,@location.longitude,:types => 'restaurant')

    @location.save




  end

  private
  def location_params
    params.require(:location).permit(:address)
  end
end
