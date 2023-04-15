Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root to: 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      
    end
  end
  
  resources :posts, only: [:index] do
    resources :comments, only: [:new, :create,:destroy]
    resources :likes, only: [:new]
  end
end
