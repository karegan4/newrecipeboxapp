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

  delete '/recipes/:id', to: 'recipes#destroy', as: 'deleterecipe'
  delete '/categories/:id', to: 'categories#destroy', as: 'deletecategory'

  get '/categories/most-popular', to: 'categories#most_popular'

  resources :recipes
  resources :categories do 
    resources :recipes  
  end
  
  
end

#Write a custom route so that when a user visits /categories/most-popular, the user sees the category with the most recipes
#On that page the user should also see the names of the all recipes  
#HINT Use the max_by Ruby method to help you find the category with the most recipes 

#Use a path helper and put a link to your new route on the home page 
