Rails.application.routes.draw do
  devise_for :admins

  resources :events, only: [:index, :show, :create, :update]
  resources :my_created_events, only: [:index, :edit, :update, :destroy]
  resources :subscriptions, only: [:create, :update, :destroy]

  resources :days, only: :show

  resource :admin_dashboard, only: :show
  resource :admin_login, only: :show

  namespace :admin_dashboard do
    resources :events, only: [:index, :edit, :destroy], controller: 'events'
    resources :admins, except: :show, controller: 'admins'
    resources :subscriptions, only: [:index, :edit, :destroy], controller: 'subscriptions'
    resource :site, only: [:edit, :update], controller: 'site'
  end


  root "events#index"
end
