Rails.application.routes.draw do
  resources :products
  post 'wishlist_entries', to: 'products#wishlist_entries'
  root to: 'application#index'
  get 'me', to: 'application#me'
end
