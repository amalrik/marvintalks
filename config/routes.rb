Rails.application.routes.draw do
  resources :forum_threads, only: [:index, :show, :create, :new]
  resources :conversations, only: [:create, :new]

  root 'forum_threads#index'

end
