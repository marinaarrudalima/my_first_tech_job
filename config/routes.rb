Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :candidates, except: :index do
    resources :matches, only: %i[index]
  end

  resources :companies, except: :index do
    resources :jobs, only: %i[new create]
  end

  resources :jobs, except: %i[new create] do
    resources :matches, only: %i[index create]
  end

  resources :matches, except: %i[index new create]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
