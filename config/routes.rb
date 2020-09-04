Rails.application.routes.draw do


  devise_for :users, 


  controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  root to: 'items#index'
  resources :items, only: [:index, :new, :show, :create]
end
