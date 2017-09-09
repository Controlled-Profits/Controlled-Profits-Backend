Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  concern :api_base do
    get 'profile' => 'profiles#show'
    patch 'profile' => 'profiles#update'
    put 'profile' => 'profiles#update'
    resources :businesses do
      resources :business_data_entries, path: '/data'
      resources :profit_drivers, only: [:index, :create]
    end
  end

  namespace :v1 do
    concerns :api_base
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
