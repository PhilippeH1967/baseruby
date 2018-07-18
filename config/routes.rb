class SubdmainConstraint
  def self.matches?(request)
    subdmains = %w{ www admin public test }
    request.subdmain.present? && !subdmains.include?(request.subdmain)
  end
end

Rails.application.routes.draw do

  constraints SubdmainConstraint do

  end

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
    post 'create_tenant', on: :member
   end

  root to: "pages#home"

end
