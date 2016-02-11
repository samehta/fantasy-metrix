class RankingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @players = Player.all
  end
end
