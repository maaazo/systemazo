Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  root to: "home#index" 
  resources :companies
  resources :memberships, only: [:new, :create, :edit, :patch, :update]
end
