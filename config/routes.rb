Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :welcome, only: :index
      resources :countries, only: [:index, :show]
      resources :breads, only: [:index, :show]
      resources :user_breads, only: [:create, :destroy]
      resources :users, only: [:index, :show, :create, :destroy]
      get "/login", to: "users#login_form"
      post "/login", to: "users#login"
      #adding these but not sure if this will work with FE? Need to clarify
    end
  end
end
