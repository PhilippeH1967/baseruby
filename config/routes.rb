Rails.application.routes.draw do

  get 'pages/home'
  namespace :admin do
    resources :users

      root to: "users#index"
    end
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations'}
  resources :users
  resources :entreprises, except: [:edit] do
    member do
      get 'entreprises/listing'
    end
  end

  root to: "pages#home"

end
