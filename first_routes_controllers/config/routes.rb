Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users


# # VERB '/path', to: 'controller#action'
# get '/chrips', to: 'chirps#index'

# # create a custom route
# get '/chirps', to: 'chirps#search'



  # get 'users', to: 'users#index', as: 'users'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

  resources :users, only: [:index, :create, :show, :update, :post, :destroy] do
    resources :artworks, only: [:index]
  end


  resources :artworks, only: [:create, :show, :update, :post, :destroy]
  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :index]
  
  get 'users/:user_id/comments', to: 'comments#index', as: 'user_comments'

  get 'artworks/:artwork_id/comments', to: 'comments#index', as: 'artwork_comments'
end
