Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :posts, only: [:index, :show, :create]
  get '/creer' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy'

  get 'users/:username' => 'users#show'


end
