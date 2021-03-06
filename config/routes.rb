Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'

  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/cities/most', to: 'cities#most'
  get '/restaurants/most-reviewed', to: 'restaurants#most'

  resources :restaurants do
    resources :reviews, only: [:new, :index, :create]
  end
  resources :cities
end


