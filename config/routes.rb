Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end

  resources :users, only:[:show, :edit, :update, :index,] do
    resource :relationships, only: [:create, :destroy]
  end

  get 'users/:id/follow' => 'users#follows',as:'users_follow'
  get 'users/:id/follower' => 'users#followers',as:'users_follower'

  get 'home/about', to: 'homes#show'

  get 'books/:id/edit' => 'books#edit'
  post 'books/:id/edit' => 'books#edit'

  post 'users/:id' => 'books#create'
  post 'users' => 'books#create'
  post 'books/:id' => 'books#create'

  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'


end
