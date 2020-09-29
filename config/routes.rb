Rails.application.routes.draw do

  root to: 'items#index'
  devise_for :users, 


  controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  resources :items, only: [:index, :new, :show]
end
