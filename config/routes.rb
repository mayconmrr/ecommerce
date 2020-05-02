# frozen_string_literal: true

Rails.application.routes.draw do
  root 'site/home#index'
  post '/rate' => 'rater#create', :as => 'rate'
  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: %i[edit create]
    resources :categories, except: %i[show destroy]
    resources :admins, except: [:show]
    resources :diagrams, only: [:index]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'
    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: %i[index edit update new create]
      resources :my_data, only: %i[edit update]
    end
    resources :ad_detail, only: %i[index show]
    resources :categories, only: [:show]
    resources :comments, only: [:create]
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }
end
