class LocationsController < ApplicationController
  def index
    @locations = Location.all

  end

  def new
    @location = Location.new
    @locations = Location.all

  end

  def create
    location = Location.new location_params
    location.save
    redirect_to location_path(location.id)

  end

  def show
    @location = Location.find params[:id]
    # Rails.application.credentials.google_api
    #retrieving longitude and latitude based on user input. reaches out to geocoder api for coordinates
    results = Geocoder.search("#{@location.address}")
    coordinates= results.first.coordinates #[latitude, longitude]
    # unless Location.exists?(address: @location.address)
    @location.latitude = coordinates.first
    @location.longitude = coordinates.last
    # end
    #image for location address call to flickr api
    image_url_id = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=63d8a83c1f8a75ab3a59b4dc4421b792&per_page=10&format=json&nojsoncallback=1&text=#{@location.address}&tags=cityscape&sort=interestingness-desc"
    image_info = HTTParty.get image_url_id
    image_id = image_info['photos']['photo'].first['id']
    image_url = "https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=63d8a83c1f8a75ab3a59b4dc4421b792&photo_id=#{image_id}&format=json&nojsoncallback=1"
    image_url_info = HTTParty.get image_url
    @location.image = image_url_info['sizes']['size'][4]['source']

    #google places points of interest
    @client = GooglePlaces::Client.new("AIzaSyDq7PyzaM_5hv6GXly9Cw4SSgrPmy0sMMQ")
    @point_of_interest= @client.spots_by_query(" #{@location.address} attractions")[0..9]

    # adding location_id to dashboard to update which locations belong to dashboard
      @dashboards =  Dashboard.where(:user_id => @current_user)

    @location.save
  end

  def favourite

    dashboard = Dashboard.find params[:dashboard_id]
    location = Location.find params[:location_id]
    dashboard.locations << location
    redirect_to dashboard

 end
 def destroy
   @location = Location.find params[:id]
   @location.destroy
   redirect_to dashboard_path
 end

  private
  def location_params
    params.require(:location).permit(:address)
  end
end
