Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # === Restrict Amazon CloudFront Bot Access ===
  # This rule ensures that Amazon CloudFront can't access anything that hits
  # ActionDispatch::Routing. This means that CloudFront can only access static
  # elements (e.g. things located in the public folder, including assets).
  # This makes sure CloudFront doesn't clone your page in its entirety.
  match('*path',
        via: :all,
        to: -> (_env) { [404, {}, []] },
        constraints: { user_agent: /Amazon CloudFront/ })

  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root to: 'projects#index'
    resources :projects, only: [:index, :show]
    resources :texts, only: [:show, :update]
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
