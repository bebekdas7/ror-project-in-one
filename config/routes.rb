Rails.application.routes.draw do
  get "orders/create"
  devise_for :users
  resources :chairs do
    member do
      get "buy_now"
    end
  end

  resources :orders, only: [ :create, :index ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "chairs#index"
  get "collection", to: "chairs#collection"

  # Add a route for handling checkout
  post "/checkout", to: "orders#create"
end
