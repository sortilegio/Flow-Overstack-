Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :questions, only: [:new, :create, :show] do
    member do
      put "qvote", to: "questions#vote"
    end
  	resources :comments, only: [:create], module: :questions
  	resources :answers, only: [:create] do
      member do
        put "avote", to: "answers#vote"
      end
  	  resources :comments, only: [:create], module: :answers
  	end
  end
  resources :answers, only: [:create] do
    member do
      put "avote", to: "answers#vote"
    end
    resources :comments, only: [:create], module: :answers
  end
end
