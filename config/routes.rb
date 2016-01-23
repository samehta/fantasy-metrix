Rails.application.routes.draw do

  devise_for :users

  resources :articles

  resources :teams do
    resources :players
  end

  resources :players, only: [] do
    resources :passing_game_logs, except: [:index, :show]
    resources :rushing_game_logs, except: [:index, :show]
  end
  
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do 
    resources :comments, only: [:create, :destroy]
  end

  root to: "welcome#index"
end