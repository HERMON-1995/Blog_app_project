Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :users, only: [] do
        resources :posts, only: [:index, :create, :update, :destroy] do
          resources :comments, only: [:index, :create, :update, :destroy]
        end
      end
    end
  end

  # get 'comments/index'
  # get 'likes/index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
      end
    end

  # Defines the root path route ("/")
  root "users#index"
end
