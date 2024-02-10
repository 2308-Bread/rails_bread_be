Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :welcome, only: :index
      resources :countries, only: [:index, :show]
      resources :breads, only: [:show]
      resources :user_breads, only: [:create, :destroy]
      resources :users, only: [:create, :destroy]
    end
  end
end
