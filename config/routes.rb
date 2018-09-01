Rails.application.routes.draw do
  root to: 'welcome#show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'

  namespace :admin do
    resources :cohorts, only: [:show] do
      resources :assignments, only: [:create]
    end
  end
end
