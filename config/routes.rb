# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'
  resources :projects do
    resources :texts, only: [:index]
  end
end
