Rails.application.routes.draw do

  devise_for :users

  resources :articles

  resources :rankings, only: [:index]

  resources :statistics, only: [:index]

  resources :nfl_teams
  
  resources :nfl_players, except: [:index] do
    resources :passing_game_logs, except: [:index, :show]
    resources :rushing_game_logs, except: [:index, :show]
    resources :receiving_game_logs, except: [:index, :show]
    resources :career_passing_stats, except: [:index, :show]
    resources :career_rushing_stats, except: [:index, :show]
    resources :career_receiving_stats, except: [:index, :show]
  end
  
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do 
    resources :comments, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  root to: "welcome#index"
end