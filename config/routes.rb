# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :searches, only: %i[new]

  get 'search', to: 'searches#create', as: 'search'

  namespace :cars do
    resources :models, only: :index
    resources :years, only: :index
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
