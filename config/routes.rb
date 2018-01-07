Rails.application.routes.draw do
  devise_for :admins

  resources :events, only: [:index, :show, :create, :update]
  resources :days, only: :show

  resource :admin_dashboard, only: :show
  resource :admin_login, only: :show

  namespace :admin_dashboard do
    resources :events, only: [:index, :edit, :update, :delete], controller: 'events'
    resources :admins, only: [:index, :new, :create, :edit, :update, :delete], controller: 'admins'
    resource :site, only: [:edit, :update], controller: 'site'
  end



  root "events#index"
end
