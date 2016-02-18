class RankingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  POSITIONS = {
    'quarterbacks' => 'Quarterback',
    'running-backs' => 'Running Back',
    'wide-receivers' => 'Wide Receiver',
    'tight-ends' => 'Tight End'
  }

  def index
    @position = POSITIONS[params[:position]]
    if @position == 'Quarterback'
      @nfl_players = NflPlayer.joins(:career_passing_stats).where(position: @position, career_passing_stats: { year: 2015 }).limit(30).order('passing_touchdowns DESC')
    elsif @position == 'Running Back'
      @nfl_players = NflPlayer.joins(:career_rushing_stats).where(position: @position, career_rushing_stats: { year: 2015 }).limit(50).order('rushing_touchdowns DESC')
    elsif @position == 'Wide Receiver'
      @nfl_players = NflPlayer.joins(:career_receiving_stats).where(position: @position, career_receiving_stats: { year: 2015 }).limit(50).order('receiving_touchdowns DESC')
    elsif @position == 'Tight End'
      @nfl_players = NflPlayer.joins(:career_receiving_stats).where(position: @position, career_receiving_stats: { year: 2015 }).limit(30).order('receiving_touchdowns DESC')
    end
  end
end
