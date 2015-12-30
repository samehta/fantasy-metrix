Rails.application.routes.draw do


  devise_for :users

  resources :articles

  resources :teams, except: [:edit, :update]
  
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do 
    resources :comments, only: [:create, :destroy]
  end

  root to: "welcome#index"
end