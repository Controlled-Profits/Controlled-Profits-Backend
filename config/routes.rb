Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  concern :api_base do
    #Business routes
    resources :businesses do
      resources :business_data_entries, path: '/data'
      resources :profit_drivers, only: [:index, :create]
      # post '/profit_drivers' => 'profit_drivers#create'
      # get '/profit_drivers' => 'profit_drivers#index'
    end
  end

  namespace :v1 do
    concerns :api_base
  end

  #root to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
