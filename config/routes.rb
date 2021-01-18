Rails.application.routes.draw do
  resources :posts
  resources :users

  post '/login', to: 'users#show'
  post '/posts/:user_id', to: 'posts#show'

  post '/rails/active_storage/direct_uploads', to: 'direct_uploads#create'

  post '/createuser', to: 'users#create' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
