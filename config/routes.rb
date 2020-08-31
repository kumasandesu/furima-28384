Rails.application.routes.draw do

  devise_for :users

  root 'items#index'

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  resources :items, only: [:index, :new, :show, :create]

end
