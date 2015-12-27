Rails.application.routes.draw do
  devise_for :mentors
  resources :mentors, only: [:index, :show]

  resources :how, only: [:index]

  root 'welcome#index'

end
