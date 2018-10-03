Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :votes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
