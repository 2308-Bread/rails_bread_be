Rails.application.routes.draw do

  #World Map
  resources :welcome, only: :index

end
