Rails.application.routes.draw do
  resources :secret_codes, only: [:index] do
    collection do
      get :generate
    end
  end
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'home#index'
end
