Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :posts, except: :destroy
  resources :search
  resources :phones
  # resources :users, only: [:show]
  get 'users/:username' => 'users#show', as: :user

  resources :shelters do
    resources :shelter_photos,  only: [:create]
    resources :pets, only: [:new, :create]
    resources :comments, only: [:create]
    resources :staffs, only: [:create, :index, :destroy]
  end
  resources :comments, only: [:destroy]
  resources :shelter_photos,  only: [:destroy]
  patch '/shelter/set_photo/:photo_id' => 'shelters#set_photo'

  post '/getRegions'  => 'shelters#getRegions'
  post '/getCities'   => 'shelters#getCities'
  post '/getUsers'    => 'shelters#getUsers'

  resources :pets, only: [:show, :edit, :update] do
    resources :pet_photos,  only: [:create]
  end
  resources :pet_photos,  only: [:destroy]
  patch '/pet/set_photo/:photo_id' => 'pets#set_photo'

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
