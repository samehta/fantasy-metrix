class RushingGameLogsController < ApplicationController
  def new
    @nfl_player = NflPlayer.find(params[:nfl_player_id])
    @rushing_game_log = RushingGameLog.new
    authorize @rushing_game_log
  end

  def edit
    @nfl_player = NflPlayer.find(params[:nfl_player_id])
    @rushing_game_log = RushingGameLog.find(params[:id])
    authorize @rushing_game_log
  end

  def create
    @nfl_player = NflPlayer.find(params[:nfl_player_id])
    @rushing_game_log = @nfl_player.rushing_game_logs.new(rushing_game_log_params)
    authorize @rushing_game_log
    if @rushing_game_log.save
      flash[:notice] = "Week #{@rushing_game_log.week} was successfully created."
      redirect_to @nfl_player
    else
      flash[:error] = "There was an error creating Week #{@rushing_game_log.week}. Please try again."
      redirect_to :new
    end
  end

  def update
    @nfl_player = NflPlayer.find(params[:nfl_player_id])
    @rushing_game_log = RushingGameLog.find(params[:id])
    authorize @rushing_game_log
    if @rushing_game_log.update_attributes(rushing_game_log_params)
      flash[:notice] = "Week #{@rushing_game_log.week} was successfully updated."
      redirect_to @nfl_player
    else
      flash[:error] = "There was an error updating Week #{@rushing_game_log.week}. Please try again."
      render :edit
    end
  end

  def destroy
    @nfl_player = NflPlayer.find(params[:nfl_player_id])
    @rushing_game_log = @nfl_player.rushing_game_logs.find(params[:id])
    authorize @rushing_game_log
    if @rushing_game_log.destroy
      flash[:notice] = "Rushing Game Log was successfully deleted."
      redirect_to @nfl_player
    else
      flash[:error] = "There was an error deleting Week #{@rushing_game_log.week}. Please try again."
      redirect_to @nfl_player
    end
  end

  private

  def rushing_game_log_params
    params.require(:rushing_game_log).permit(:season, :week, :date, :opponent, :rushing_attempts, :rushing_yards, 
      :rushing_touchdowns, :receptions, :receiving_yards, :receiving_touchdowns, :fantasy_points, :ppr_fantasy_points)
  end
end
