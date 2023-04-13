Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new]
    end
  end
  get 'posts/:id', to: 'posts#show', as: 'post'
  delete 'sign_out', to: 'devise/sessions#destroy', as: :sign_out
end
