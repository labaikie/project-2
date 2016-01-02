Rails.application.routes.draw do

  root 'static_pages#home'

  get 'users/' => 'users#index', as: :users
  get 'users/new' => 'users#new', as: :new_user
  post '/' => 'users#create'

  get 'users/edit/:id' => 'users#edit', as: :edit_user
  get 'users/:id' => 'users#show', as: :user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'


  get 'sessions/new' => 'sessions#new', as: :new_session
  post 'sessions/new' => 'sessions#create', as: :create_session

  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'targets/' => 'targets#index', as: :targets

  resources :posts, only: [:create, :destroy, :new]

end
