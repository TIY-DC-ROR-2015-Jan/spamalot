Rails.application.routes.draw do
  devise_for :users

  resources :deliveries, only: [:new, :create]

  root 'deliveries#new'
end
