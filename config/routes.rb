Clicker::Application.routes.draw do

  devise_for :users

  resources :homes


  root to: "homes#index"

end
