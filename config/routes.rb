Rails.application.routes.draw do
  root 'home#index'
  get '/driversandcars' => 'home#driversandcars', :as => 'driversandcars'

  #get 'home/driversandcars'
  get 'home/search'
  #get 'searchByIds' =>'home#searchByIds', :as => 'searchByIds'
  get 'cars/newTest', controller: 'car', action: 'newTest'
  post "/searchByCarId" => "drivers#searchByCarId", :as => :searchByCarId
  post "/searchByDriverId" => "cars#searchByDriverId", :as => :searchByDriverId
  resources :drivers
  resources :cars

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
