Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  root to: 'welcome#index'
  get 'welcome/about'
  get 'courses/planning'
  resources :students
  resources :courses do 
    resources :waits
  end
  resources :enrollments
  resources :schedules
end
