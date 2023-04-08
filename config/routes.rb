Rails.application.routes.draw do
  get 'posts/:id', to: 'posts#show', as: 'post'
  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
        resources :likes, only: [:new, :create]
  end
  end
end