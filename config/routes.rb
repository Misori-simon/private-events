Rails.application.routes.draw do
  get 'invitation/create'
  delete 'invitation/destroy'
  get 'attendance/create'
  resources :events
  get 'session/new'
  delete 'session/destroy'
  post 'session/log_in'
  resources :users
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
