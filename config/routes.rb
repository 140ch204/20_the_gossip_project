Rails.application.routes.draw do
  
  root 'gossip#index'
  resources :gossip do
  	resources :comment
  end
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :author
  resources :welcome, only: [:index, :show]
  resources :city, only: [:show]

end
