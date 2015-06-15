Clicker::Application.routes.draw do

  devise_for :users, :skip => :registerable

  devise_scope :user do
    match '/admin/users', to: 'admin/users#create', via: :post
  end

  resources :homes

  resources :courses do
    member do
      post :add
    end
  end

  resources :students

  resources :teachers

  resources :profiles

  resources :interactive_items

  namespace :admin do

    get '/' => 'admins#index'
    resources :admins

    resources :courses do

      resources :interactive_items do

        resources :attendances

        resources :quizzes

        resources :polls

      end

    end

    resources :students

    resources :teachers

    resources :users


  end


  root to: "homes#index"


end
