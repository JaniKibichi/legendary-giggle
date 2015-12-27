Rails.application.routes.draw do
  devise_for :mentors

  resources :mentors, only: [:index, :show] do
   resources :episodes
  end

  authenticated :mentor do
   root 'mentors#dashboard', as: "authenticated_root"
  end

  resources :how, only: [:index]

  root 'welcome#index'

end
