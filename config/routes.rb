Rails.application.routes.draw do
  get '/hello', to: 'static_pages#hello'
  get '/about', to: 'static_pages#about'
  get '/sign_up', to: 'users#new'
  root 'static_pages#hello'
  resources :users
end
