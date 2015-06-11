Clicker::Application.routes.draw do

  devise_for :users

  resources :homes

  resources :courses

  resources :students

  resources :teachers

  namespace :admin do

    get '/' => 'admins#index'
    resources :admins

    resources :courses

    resources :students

    resources :teachers

  end


  root to: "homes#index"

end
