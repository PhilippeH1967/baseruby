Rails.application.routes.draw do

  get 'layouts/confirmed'
  get 'pages/home'
  namespace :admin do
    resources :users

      root to: "users#index"
    end
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations'}
  resources :users
  resources :entreprises

  root to: "pages#home"

end
