Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  namespace :api do
    #resources :uploads, :only => [:index, :show, :create]
    post '/email' => 'email#create' 
    devise_for :users
  end
end
