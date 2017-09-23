Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :users, only: [:show, :edit, :update, :index]
  resources :pets
  resources :posts

  resources :shelters
  post '/getRegions'  => 'shelters#getRegions'
  post '/getCities'   => 'shelters#getCities'

  resources :shelter_photos, only: [:create, :destroy, :show]

end
