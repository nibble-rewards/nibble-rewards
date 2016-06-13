Rails.application.routes.draw do
  devise_for :users
  root 'main#index'

  namespace :api do
    #resources :uploads, :only => [:index, :show, :create]

    get '/webhook' => 'webhook#create' #testing url
    post '/webhook' => 'webhook#create'

    post '/email' => 'email#create' 
    post '/markdown' => 'markdown#convert'
    devise_for :users

    resources :square_integrations
    resources :campaigns
  end
end
