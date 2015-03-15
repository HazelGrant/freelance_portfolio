Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/about'      => 'static_pages#about'

  resources :portfolio_pieces, except: [:index]
  get '/portfolio', controller: "portfolio_pieces", action: "index"

  devise_for :users, controllers: { registrations: 'users/registrations' }

end
