Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only =>[:index, :new, :create]
  delete "/dashboards/:dashboard_id/locations/delete" => "dashboards#remove"
  post "/dashboards/dashboard"
  delete "/dashboards/gone" 
  resources :locations
  resources :dashboards
  post   "/locations/favourite" => "locations#favourite",   as: :favourite_dashboard
  get '/locations/:id/nonav' => "locations#nonav"
  get '/login' => 'session#new' #login form
  post '/login' => 'session#create' # perform a login
  delete '/login' => 'session#destroy' #perform a log out
end
