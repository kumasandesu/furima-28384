Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :new, :showte, :crea]

end
