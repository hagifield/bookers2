Rails.application.routes.draw do
  devise_for :users
  get 'home/top'
  get 'home/about'

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root to: 'home#top'
get 'home/about' => 'home#about' , as: 'about'

resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy]
resources :users


end