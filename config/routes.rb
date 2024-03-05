Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'home#index'
  resources :appointments
  resources :client_intake_forms
  resources :companies
  resources :memberships, only: %i[new create edit patch update]
end
