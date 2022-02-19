Rails.application.routes.draw do
  devise_for :users
  root to: 'main#index'

  resources :courses
  resources :groups
  resources :subjects
  resources :group_subjects
  resources :profiles
  resources :users
  resources :exams

end
