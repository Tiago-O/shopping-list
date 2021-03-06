Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # get 'lists', to: 'lists#index'
  # get 'lists/:id', to: 'lists#show', as: :list

  resources :lists, only: [:index, :show, :create, :destroy] do
    resources :items, only: [:create]
  end
  # delete 'items/:id', to: 'items#destroy', as: :item_delete
  resources :items, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
