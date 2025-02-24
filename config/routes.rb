# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: 'home#index'

  resources :projects do
    resource :comments, only: :create

    member do
      patch :change_status
    end
  end
end
