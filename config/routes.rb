Rails.application.routes.draw do
  
  get '/gossip/:id', to: 'gossip#show'
  get '/gossip', to: 'landing#page'
  get '/', to: 'landing#page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome/:first_name', to: 'welcome#user'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
end
