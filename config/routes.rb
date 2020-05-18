Rails.application.routes.draw do

  root 'home#top'
  get 'home/about' => 'home#about'

  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
  end
  get 'users/:id/quit' => 'users#quit', as: 'quit'
  put 'users/:id/hide' => 'users#hide', as: 'users_hide'

  resources :items, only: [:index, :show, :create] #createは一時的に作成（管理者ページができたら削除）

  get 'genres/:id' => 'genres#show'

  resources :cart_items, only: [:create, :index, :destroy, :update]
  delete 'cart_items' => 'cart_items#all_destroy', as:'cart_all_destroy'

  resources :orders, only: [:index, :show, :new, :create]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'

  namespace :admin do
  end

end
