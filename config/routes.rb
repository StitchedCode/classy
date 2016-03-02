Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root to: 'projects#index'
    resources :projects, only: [:index, :show] do
      resources :texts, only: [:show, :update]
    end
    get '/about' => 'pages#about'
  end

  unauthenticated :user do
    devise_scope :user do
      get '/' => 'pages#landing', as: 'landing'
      get '/robots.txt' => 'pages#robots'
      get '/about' => 'pages#about'
    end
  end
end
