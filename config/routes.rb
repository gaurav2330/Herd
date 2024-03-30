Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  resources :users
  resources :movies, only: [:index, :show]
  resources :genres, only: [:index] do
    resources :movies, only: [:index]
  end
  resources :creators, only: [:index] do
    resources :movies, only: [:index]
  end
end
