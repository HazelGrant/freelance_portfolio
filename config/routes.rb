Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/about'      => 'static_pages#about'
  
  resources :portfolio_pieces, except: [:index], path: 'portfolio-pieces' do 
    resources :images
  end
  get '/portfolio', controller: "portfolio_pieces", action: "index"

  resources "contacts", only: [:new, :create]

  devise_for :users, controllers: { registrations: 'users/registrations' }

end
