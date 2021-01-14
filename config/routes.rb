Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'


  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'session'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'

  get '/newestrecipes', to: 'recipes#newestrecipes'

  get '/auth/facebook/callback' => 'sessions#omniauth'

  
  resources :recipes
  resources :categories do 
    resources :recipes  
  end
  
  
end
