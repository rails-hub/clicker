Clicker::Application.routes.draw do

  devise_for :users,:skip => :registerable

  devise_scope :user do
    match '/admin/users', to: 'admin/users#create', via: :post
  end

  resources :homes

  resources :courses

  resources :students


  namespace :admin do

    get '/' => 'admins#index'
    resources :admins

    resources :courses

    resources :students

    resources :teachers

    resources :users


  end


  root to: "homes#index"



end
