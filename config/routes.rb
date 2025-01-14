Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :friendships

  get 'my_requests', to: 'users#my_requests'
  get 'my_friends', to: 'users#my_friends'

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
