Rails.application.routes.draw do

  get 'layouts/confirmed'
  get 'pages/home'
  get 'entreprises/listing'

  namespace :admin do
    resources :users

      root to: "users#index"
    end
  devise_for :users, :controllers => { registrations: 'registrations', confirmations: 'confirmations'}
  resources :users
  resources :entreprises do
    post 'hide_case', on: :member
    post 'unhide_case', on: :member
   end

  root to: "entreprises#listing"

end
