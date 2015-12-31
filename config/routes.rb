Rails.application.routes.draw do
  devise_for :mentors

  resources :mentors, only: [:index, :show] do
   resources :episodes
   resources :posts
  end

  authenticated :mentor do
   root 'mentors#dashboard', as: "authenticated_root"
  end

  resources :contacts, only: [:new, :create]
  resources :how, only: [:index]

  resources :hubs do
   collection do
     get 'search'
   end
  end

  root 'welcome#index'
  get '/how' => 'how#index'
  get '/schedules' => 'schedules#index'
end
