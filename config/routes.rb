Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'

  namespace :admin do
    resources :cohorts, only: [:show, :index, :create] do
      resources :assignments, only: [:create]
    end
  end
end
