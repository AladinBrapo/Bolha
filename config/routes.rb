Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  resources :listings do
    resources :messages, only: [:create]
  end
  devise_for :users
  resources :categories, only: [:show] do
    resources :listings, only: [:index]
  end

  # Defines the root path route ("/")
  root 'listings#index'

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :destroy] do
      member do
          patch :promote
        end
    end
    resources :listings do
      member do
        patch :approve
      end
    end
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
    root to: "dashboard#index"
  end
  
end
