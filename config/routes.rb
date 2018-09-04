Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'

  resources :windows, only: [:show]
  resources :assignments, only: [:show] do
    resources :attributes, only: [:create]
    resources :self_evaluations, only: [:new, :create]
  end

  namespace :admin do
    resources :cohorts, only: [:show, :index, :create] do
      resources :assignments, only: [:create, :index]
    end
  end
end
