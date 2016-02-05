class RankingsController < ApplicationController
  def index
    @players = Player.all
  end
end
