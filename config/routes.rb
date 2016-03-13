Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  root to: 'welcome#index'
  get 'welcome/about'
  get 'courses/planning'
  resources :students
  resources :courses
  resources :schedules
  resources :waitlists
  get '/waitlist_student/:waitlist_id', to:'waitlist_students#new', as: 'new_waitlist_student'
  resources :waitlist_students, only: [:create, :destroy]
end
