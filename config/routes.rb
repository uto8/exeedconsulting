Rails.application.routes.draw do
  devise_for :users
  root 'pages#home' do
    collection do
      get 'search'
    end
  end
  resources :orders, only: [:index, :create]
  get 'favorites', to: 'favorites#index'
  resources :items do
    resource :favorites, only: [:create, :destroy]
    member do
      delete :delete_photo
      resources :orders, only: [:new]
    end
  end
  resources :chats
  resources :item_messages, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
