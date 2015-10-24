Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:edit, :update, :show]
  root to: 'welcome#index'
  get 'welcome/about'
  resources :students
  
end
