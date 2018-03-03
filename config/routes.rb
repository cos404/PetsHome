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
      resources :countries, except: [:destroy, :show]

      get '/regions/:country_id' => 'regions#index', as: :region
      get '/regions' => 'regions#index', as: :regions
      resources :regions, except: [:destroy, :index, :show]

      get '/cities/:region_id' => 'cities#index', as: :city
      get '/cities' => 'cities#index', as: :cities
      resources :cities, except: [:destroy, :index, :show]
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
