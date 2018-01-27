Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :users, only: [:show, :edit, :update, :index]
  resources :posts

  resources :shelters do
    resources :pets
    post    'addStaff/:user_id'     => 'shelters#addStaff'
    delete  'deleteStaff/:user_id'  => 'shelters#deleteStaff'
  end
  post '/getRegions'  => 'shelters#getRegions'
  post '/getCities'   => 'shelters#getCities'
  post '/getUsers'    => 'shelters#getUsers'
  resources :shelter_photos,  only: [:create, :destroy, :show]
  resources :pet_photos,      only: [:create, :destroy, :show]

  get "/admin" => "admin/home#index"
  namespace :admin do

    ## LOCATION PAGE
    get '/location' => 'settings#location_index'
      # COUNTRY ROUTES
      get     '/country'      => 'settings#location_index'
      post    '/country'      => 'settings#create_country'
      delete  '/country/:id'  => 'settings#destroy_country'

      # REGION ROUTES
      get     '/region'       => 'settings#location_index'
      post    '/get_regions'  => 'settings#get_regions'
      post    '/region'       => 'settings#create_region'
      delete  '/region/:id'   => 'settings#destroy_region'

      # CITY ROUTES
      get     '/city'       => 'settings#location_index'
      post    '/get_cities' => 'settings#get_cities'
      post    '/city'       => 'settings#create_city'
      delete  '/city/:id'   => 'settings#destroy_city'
  end
end
