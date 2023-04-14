Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root to: 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
    end
  end
  
  resources :posts, only: [] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new]
  end
end
