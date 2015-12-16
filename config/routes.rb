Rails.application.routes.draw do

  devise_for :users
  
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts do 
    resources :comments, only: [:create]
  end

  root to: "welcome#index"
end