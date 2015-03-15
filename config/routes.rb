Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/about'      => 'static_pages#about'

  resources :portfolio_pieces

  devise_for :users

end
