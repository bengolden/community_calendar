Rails.application.routes.draw do
  devise_for :admins

  resources :events, only: [:index, :show, :create]
  resources :days, only: :show

  resource :admin_dashboard, only: :show

  namespace :admin_dashboard do
    resources :events, only: [:index, :edit, :update, :delete], controller: 'events'
    resources :users, only: [:index, :edit, :update, :delete]
    resource :site, only: [:edit, :update]
  end


  root "events#index"
end
