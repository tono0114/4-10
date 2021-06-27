Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index,:show,:edit,:update]
  resources :books, only: [:create,:index,:show,:edit,:update,:destroy]
  root to:'homes#top'
  get 'home/about' => 'homes#show'
end
