Rails.application.routes.draw do
  root 'posts#index'
  resources :votes
  resources :posts
  resources :users, only: [:index, :show]
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
