Rails.application.routes.draw do
  root to: 'application#index'
  get 'me', to: 'application#me'
end
