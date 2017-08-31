Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  concern :api_base do
    #Business routes
    resources :businesses do
      member do 
        get 'data', to: 'businesses#index_data'
      end
      #Incomes routes
      resources :incomes
    end
  end

  namespace :v1 do
    concerns :api_base
  end

  #root to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
