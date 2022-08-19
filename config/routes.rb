Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :orders, only: [:index]
  get 'favorites', to: 'favorites#index'
  resources :items do
    resource :favorites, only: [:create, :destroy]
    member do
      delete :delete_photo
      resources :orders, only: [:new, :create]
    end
  end
  resources :chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
