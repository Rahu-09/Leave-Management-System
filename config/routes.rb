Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  get 'home/profile'
  get 'home/holiday'
  get 'leave_applications/approver'
  resources :leave_applications
  # get 'leave/index'
  # get 'leave/new'
  # post 'leave/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
