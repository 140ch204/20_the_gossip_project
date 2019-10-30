Rails.application.routes.draw do

  resources :gossip, except: [:destroy] 
  resources :author
  resources :welcome, only: [:index, :show]
  resources :city, only: [:show]

  root 'gossip#index'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'

  #______OLD1___________#

  
  #get '/author/:id', to: 'author#show'
  #get '/gossip/:id', to: 'gossip#show'
  #get '/gossip', to: 'landing#page'
  #get '/', to: 'landing#page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/welcome/:first_name', to: 'welcome#user'
  #get '/contact', to: 'static_pages#contact'
  #get '/team', to: 'static_pages#team'
end
