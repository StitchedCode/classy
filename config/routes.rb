Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    mount Resque::Server.new, at: '/resque'
    root to: 'projects#index'
    resources :projects, only: [:index, :show] do
      get '/texts/random' => 'random_texts#show'
      resources :texts, only: [:update]
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

  namespace :admin do
    get '/upload' => 'upload#new'
    post '/upload' => 'upload#create'
    get '/add_texts' => 'upload#edit'
    patch '/add_texts' => 'upload#update'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
