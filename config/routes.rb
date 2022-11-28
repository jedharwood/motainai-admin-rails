# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  namespace :api do
    resources :users, only: :show # Maybe this route as controller/method has been superceded
    get '/user_by_email' => 'user_by_email#show', as: :user_by_email
  end

  resources :prefecture, only: :show

  resources :city, only: %i[index new show]
  post 'city/new', to: 'city#create'
  get 'city/:id/edit', to: 'city#edit', as: 'edit_city'
  patch 'city/:id/edit', to: 'city#update'
  put 'city/:id/edit', to: 'city#update'
  delete 'city/:id', to: 'city#destroy'

  resources :waste_type, only: %i[new show]
  post 'waste_type/new', to: 'waste_type#create'
  get 'waste_type/:id/edit', to: 'waste_type#edit', as: 'edit_waste_type'
  patch 'waste_type/:id/edit', to: 'waste_type#update'
  put 'waste_type/:id/edit', to: 'waste_type#update'
  delete 'waste_type/:id', to: 'waste_type#destroy'

  resources :profile, only: :show
  get 'profile/:id/edit', to: 'profile#edit', as: 'edit_profile'
  patch 'profile/:id/edit', to: 'profile#update'
  put 'profile/:id/edit', to: 'profile#update'
  post 'profile/:id/approve', to: 'profile#approve', as: 'approve_profile'

  resources :user, only: :index
end
