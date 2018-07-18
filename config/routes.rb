Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only =>[:index, :new, :create]
  resources :locations
  resources :dashboards
  get "/dashboards/location/delete" => "dashboards#remove_location"
  post   "/locations/favourite" => "locations#favourite",   as: :favourite_dashboard
  get '/login' => 'session#new' #login form
  post '/login' => 'session#create' # perform a login
  delete '/login' => 'session#destroy' #perform a log out
end
