Rails.application.routes.draw do

  devise_for :users

  resources :articles

  resources :rankings, path: 'nfl/rankings', only: [:index]

  resources :metrics, path: 'nfl/metrics', only: [:index]

  resources :nfl_teams, path: '/nfl/teams'
  
  resources :nfl_players, path: '/nfl/players', except: [:index] do
    resources :passing_game_logs, except: [:index, :show]
    resources :rushing_game_logs, except: [:index, :show]
    resources :receiving_game_logs, except: [:index, :show]
    resources :career_passing_stats, except: [:index, :show]
    resources :career_rushing_stats, except: [:index, :show]
    resources :career_receiving_stats, except: [:index, :show]
  end
  
  resources :topics, path: 'forums' do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do 
    resources :comments, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  root to: "welcome#index"
end