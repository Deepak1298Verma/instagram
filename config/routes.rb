Rails.application.routes.draw do
  resources :follows
  get 'search/index'
  get 'profile/show'
  get 'search' => 'search#index'
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users, only: [:show, :edit, :update, :follow, :unfollow, :new, :create]
    post '/users/:id/follow', to: "users#follow", as: "follow_user"
    post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  resources :posts, only: [:create, :new, :show, :destroy]

end