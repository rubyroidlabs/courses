Rails.application.routes.draw do
  root to: 'beers#index'

  resources :beers
end
