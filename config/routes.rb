Rails.application.routes.draw do
  get 'schedules/new'

  get 'schedules/show'

  get 'schedules/edit'

  devise_for :users
  resources :users, only: [:edit, :update, :show]
  root to: 'welcome#index'
  get 'welcome/about'
  get 'courses/planning'
  resources :students
  resources :courses
  resources :enrollments
  resources :schedules
end
