Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'home#index'
  resources :appointments
  resources :client_intake_forms do
    member do
      get 'generate_pdf'
    end
  end
  resources :companies do
    resources :appointments
  end
  resources :memberships, only: %i[new create edit patch update]
  resources :employment_application_forms, path: 'employees'
end
