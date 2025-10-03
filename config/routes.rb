Rails.application.routes.draw do
  resources :clients do
    resources :client_addresses, except: [:index, :show] 
  end
  resources :user_profiles
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "front#index"
end
