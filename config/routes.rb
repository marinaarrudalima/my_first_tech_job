Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :candidates, except: :index

  resources :companies

  resources :jobs do
    get "my_jobs", on: :collection
    resources :matches, only: %i[index create] # quem acessa o index é company quem acessa create é candidate
  end

  resources :matches, only: %i[update destroy] do
    get 'my', on: :collection
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
