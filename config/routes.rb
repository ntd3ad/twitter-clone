Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :tweets, only: [:show, :create, :destroy ] do
    resources :likes, only: [:create, :destroy]
  end

  post '/tweet_delete', to: 'tweets#destroy'

  get :dashboard, to: "dashboard#index"
  resources :usernames, only: [:new, :update]

end
