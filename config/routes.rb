Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/tasks', to: 'tasks#index'
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  root 'tasks#index'
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update]
end
