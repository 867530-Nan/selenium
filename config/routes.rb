Rails.application.routes.draw do
  resources :classrooms

  root 'classrooms#index'
end
