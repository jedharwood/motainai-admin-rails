Rails.application.routes.draw do
  devise_for :users
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
end
