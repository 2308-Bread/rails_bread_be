Rails.application.routes.draw do

  #World Map
  resources :welcome, only: :index

  namespace :api do
    namespace :v1 do
      resources :breads, only: [:show] do
        
      end
    end
  end
end
