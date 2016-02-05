class StatisticsController < ApplicationController
  def index
    @players = Player.all
  end
end