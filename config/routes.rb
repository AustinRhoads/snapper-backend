Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  get '/auth/google_oauth2/callback' => 'sessions#create'
  resources :sessions
  namespace :api do
    namespace :v1 do
      resources :users
    
    end
  end
end
