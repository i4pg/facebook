Rails.application.routes.draw do
  resources :likes, only: %i[create destroy]
  resources :posts
  get 'users/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'
end
