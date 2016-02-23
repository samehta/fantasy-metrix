class MetricsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  helper_method :sort_column

  POSITIONS = {
    'quarterbacks' => 'Quarterback',
    'running-backs' => 'Running Back',
    'wide-receivers' => 'Wide Receiver',
    'tight-ends' => 'Tight End'
  }

  def index
    @position = POSITIONS[params[:position]]
    if @position == 'Quarterback'
      @nfl_players = NflPlayer.joins(:career_passing_stats).where(position: @position, career_passing_stats: { year: 2015 }).limit(35).order(sort_column + " DESC")
    elsif @position == 'Running Back'
      @nfl_players = NflPlayer.joins(:career_rushing_stats).where(position: @position, career_rushing_stats: { year: 2015 }).limit(50).order(sort_column + " DESC")
    elsif @position == 'Wide Receiver'
      @nfl_players = NflPlayer.joins(:career_receiving_stats).where(position: @position, career_receiving_stats: { year: 2015 }).limit(50).order(sort_column + " DESC")
    elsif @position == 'Tight End'
      @nfl_players = NflPlayer.joins(:career_receiving_stats).where(position: @position, career_receiving_stats: { year: 2015 }).limit(35).order(sort_column + " DESC")
    end
  end

  private

  def sort_column
    if @position == 'Quarterback'
      CareerPassingStat.column_names.include?(params[:sort]) ? params[:sort] : "passing_yards"
    elsif @position == 'Running Back'
      CareerRushingStat.column_names.include?(params[:sort]) ? params[:sort] : "rushing_yards"
    elsif @position == 'Wide Receiver' || 'Tight End'
      CareerReceivingStat.column_names.include?(params[:sort]) ? params[:sort] : "receiving_yards"     
    end
  end
end