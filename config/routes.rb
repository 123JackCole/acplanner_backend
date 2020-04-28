Rails.application.routes.draw do
  resources :tasks
  namespace :api do
    namespace :v1 do
      resources :villagers
      resources :dailychecklists
      resources :fossils
      resources :fish
      resources :bugs
      resources :collectables
      resources :settings
      resources :users
      resources :tasks
      
      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
      get '/current_user', to: 'auth#show'
    end
  end 
end
