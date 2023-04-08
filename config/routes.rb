Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new] do
  resources :posts, only:[:index, :show , :new] do
  resources :comments, only: [:new, :create]
  resources :likes, only: [:new, :create]
  end
  end
end