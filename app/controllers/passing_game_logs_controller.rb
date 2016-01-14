class PassingGameLogsController < ApplicationController

  def new
    @player = Player.find(params[:player_id])
    @passing_game_log = PassingGameLog.new
    authorize @passing_game_log
  end

  def edit
    @player = Player.find(params[:player_id])
    @passing_game_log = PassingGameLog.find(params[:id])
    authorize @passing_game_log
  end

  def create
    @player = Player.find(params[:player_id])
    @passing_game_log = @player.passing_game_logs.new(passing_game_log_params)
    authorize @passing_game_log
    if @passing_game_log.save
      flash[:notice] = "Week #{@passing_game_log.week} was successfully created."
      redirect_to [@player.team, @player]
    else
      flash[:error] = "There was an error creating Week #{@passing_game_log.week}. Please try again."
      redirect_to :new
    end
  end

  def update
    @player = Player.find(params[:player_id])
    @passing_game_log = PassingGameLog.find(params[:id])
    authorize @passing_game_log
    if @passing_game_log.update_attributes(passing_game_log_params)
      flash[:notice] = "Week #{@passing_game_log.week} was successfully updated."
      redirect_to [@player.team, @player]
    else
      flash[:error] = "There was an error updating Week #{@passing_game_log.week}. Please try again."
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:player_id])
    @passing_game_log = @player.passing_game_logs.find(params[:id])
    authorize @passing_game_log
    if @passing_game_log.destroy
      flash[:notice] = "Passing Game Log was successfully deleted."
      redirect_to [@player.team, @player]
    else
      flash[:error] = "There was an error deleting Week #{@passing_game_log.week}. Please try again."
      redirect_to [@player.team, @player]
    end
  end

  private

  def passing_game_log_params
    params.require(:passing_game_log).permit(:season, :week, :date, :opponent, :completions, :passing_attempts, :passing_yards, 
      :passing_touchdowns, :interceptions, :rushing_attempts, :rushing_yards, :rushing_touchdowns, :fantasy_points)
  end
end
