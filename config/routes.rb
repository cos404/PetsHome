Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :posts, except: :destroy
  resources :search

  # resources :users, only: [:show]
  get 'users/:username' => 'users#show', as: :user

  resources :shelters do
    resources :pets, except: :destroy
    post    'addStaff/:user_id'     => 'shelters#addStaff'
    delete  'deleteStaff/:user_id'  => 'shelters#deleteStaff'
  end

  post '/getRegions'  => 'shelters#getRegions'
  post '/getCities'   => 'shelters#getCities'
  post '/getUsers'    => 'shelters#getUsers'

  resources :shelter_photos,  only: [:create, :destroy, :index]
  resources :pet_photos,      only: [:create, :destroy, :index]

  get "/admin" => "admin/home#index"
  namespace :admin do

    get '/settings' => "settings#index"
    post '/generateSheltersJSON' => "settings#generateSheltersJSON"

    resources :users,     except: :destroy
    resources :shelters,  except: :destroy
    resources :pets,      except: :destroy

    post '/getRegions'  => 'shelters#getRegions'
    post '/getCities'   => 'shelters#getCities'

    get '/locations' => 'locations/countries#index'
    namespace :locations do
      resources :countries, except: [:destroy]

      get '/regions/:country_id' => 'regions#index', as: :admin_locations_region
      resources :regions, except: [:destroy, :index]

      get '/cities/:region_id' => 'cities#index', as: :admin_locations_city
      resources :cities, except: [:destroy]

    end
  end

  # SINGLE PAGES
  get '/terms'    => 'pages#terms'
  get '/about'    => 'pages#about'
  get '/sitemap'  => 'pages#sitemap'
  get '/press'    => 'pages#press'
  get '/contacts' => 'pages#contacts'
  post '/send_mail'    => 'pages#send_mail'
end
