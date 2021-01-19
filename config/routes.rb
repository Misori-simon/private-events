Rails.application.routes.draw do
  resources :events
  get 'session/new'
  get 'attendance/new' => 'events#attendance_new'
  delete 'session/destroy'
  post 'session/log_in'
  resources :users
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
