Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  #Business routes
  get '/businesses' => 'businesses#index'
  get '/businesses/:bid' => 'businesses#show'
  post '/businesses' => 'businesses#create'
  patch '/businesses/:bid' => 'businesses#update'
  put '/businesses/:bid' => 'businesses#update'

  #Incomes routes
  get '/businesses/:bid/incomes' => 'incomes#index'
  get '/businesses/:bid/incomes/:income_id' => 'incomes#show'
  post '/businesses/:bid/incomes' => 'incomes#create'
  patch '/businesses/:bid/incomes/:income_id' => 'incomes#update'
  put '/businesses/:bid/incomes/:income_id' => 'incomes#update'

  #root to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
