class StatisticsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @nfl_players = NflPlayer.all
  end
end