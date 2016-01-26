class ReceivingGameLogsController < ApplicationController
  def new
    @player = Player.find(params[:player_id])
    @receiving_game_log = ReceivingGameLog.new
    authorize @receiving_game_log
  end

  def edit
    @player = Player.find(params[:player_id])
    @receiving_game_log = ReceivingGameLog.find(params[:id])
    authorize @receiving_game_log
  end

  def create
    @player = Player.find(params[:player_id])
    @receiving_game_log = @player.receiving_game_logs.new(receiving_game_log_params)
    authorize @receiving_game_log
    if @receiving_game_log.save
      flash[:notice] = "Week #{@receiving_game_log.week} was successfully created."
      redirect_to [@player.team, @player]
    else
      flash[:error] = "There was an error creating Week #{@receiving_game_log.week}. Please try again."
      redirect_to :new
    end
  end

  def update
    @player = Player.find(params[:player_id])
    @receiving_game_log = ReceivingGameLog.find(params[:id])
    authorize @receiving_game_log
    if @receiving_game_log.update_attributes(receiving_game_log_params)
      flash[:notice] = "Week #{@receiving_game_log.week} was successfully updated."
      redirect_to [@player.team, @player]
    else
      flash[:error] = "There was an error updating Week #{@receiving_game_log.week}. Please try again."
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:player_id])
    @receiving_game_log = @player.receiving_game_logs.find(params[:id])
    authorize @receiving_game_log
    if @receiving_game_log.destroy
      flash[:notice] = "Receiving Game Log was successfully deleted."
      redirect_to [@player.team, @player]
    else
      flash[:error] = "There was an error deleting Week #{@receiving_game_log.week}. Please try again."
      redirect_to [@player.team, @player]
    end
  end

  private

  def receiving_game_log_params
    params.require(:receiving_game_log).permit(:season, :week, :date, :opponent, :targets, :receptions, :receiving_yards, 
      :receiving_touchdowns, :rushing_attempts, :rushing_yards, :rushing_touchdowns, :fantasy_points, :ppr_fantasy_points)
  end
end
