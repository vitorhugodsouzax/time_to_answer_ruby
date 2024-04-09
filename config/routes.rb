Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
    get 'search', to: 'search#questions'
    get 'search_subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile/edit', to: 'profile#edit', as: 'profile_edit'
  end

  namespace :admins_backoffice do
    get 'welcome/index'  #dashboard
    resources :admins  # administradores
    resources :subjects  #assuntos/areas  
    resources :questions #perguntas
  end

  devise_for :admins, skip: [:registrations]
  devise_for :users
  
  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'  
end
