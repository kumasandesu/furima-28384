Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  resources :items, only: [:index, :new, :showte, :crea]

end
