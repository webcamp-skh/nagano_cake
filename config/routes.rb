Rails.application.routes.draw do

  namespace :admin do
    get 'search/search'
  end
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admin/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admin/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admin/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  root 'home#top'
  get 'home/about' => 'home#about'

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
  end
  get 'users/:id/quit' => 'users#quit', as: 'quit'
  put 'users/:id/hide' => 'users#hide', as: 'users_hide'

  get 'item/search' => 'items#search', as: 'item/search'
  resources :items, only: [:index, :show]

  get 'genres/:id' => 'genres#show', as: 'genre_show'

  resources :cart_items, only: [:create, :index, :destroy, :update]
  delete 'cart_items' => 'cart_items#all_destroy', as: 'cart_all_destroy'

  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :show, :new, :create]


  namespace :admin do
    root 'orders#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    get 'item/search' => 'items#search'
    resources :genres, only: [:index, :create, :edit, :update]
    get 'orders/user_index' => 'orders#user_index'
    get 'orders/today_index' => 'orders#today_index'
    resources :orders, only:[:index, :show, :update]
    resources :order_items, only: [:update]
    get "search" => "search#search"
  end
end
