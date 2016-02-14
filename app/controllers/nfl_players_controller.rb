class NflPlayersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @nfl_player = NflPlayer.friendly.find(params[:id])
    @passing_game_logs = @nfl_player.passing_game_logs 
    @passing_game_log = PassingGameLog.new
    @rushing_game_logs = @nfl_player.rushing_game_logs
    @rushing_game_log = RushingGameLog.new
    @receiving_game_logs = @nfl_player.receiving_game_logs
    @receiving_game_log = ReceivingGameLog.new
    authorize @nfl_player
  end

  def new
    @nfl_player = NflPlayer.new
    authorize @nfl_player
  end

  def edit
    @nfl_player = NflPlayer.friendly.find(params[:id])
    authorize @nfl_player
  end

  def create
    @nfl_player = NflPlayer.new(nfl_player_params)
    authorize @nfl_player
    if @nfl_player.save
      flash[:notice] = "#{@nfl_player.name} was successfully created."
      redirect_to @nfl_player
    else
      flash[:error] = "There was an error creating the NFL player. Please try again."
      render :new
    end
  end

  def update
    @nfl_player = NflPlayer.friendly.find(params[:id])
    authorize @nfl_player
    if @nfl_player.update_attributes(nfl_player_params)
      flash[:notice] = "#{@nfl_player.name} was successfully updated."
      redirect_to @nfl_player
    else
      flash[:error] = "There was an error updating #{@nfl_player.name}. Please try again."
      render :edit
    end
  end

  def destroy
    @nfl_player = NflPlayer.friendly.find(params[:id])
    authorize @nfl_player
    if @nfl_player.destroy
      flash[:notice] = "The NFL player was successfully deleted."
      redirect_to nfl_teams_path
    else
      flash[:error] = "There was an error deleting #{@nfl_player.name}. Please try again."
      render :show
    end
  end

  private

  def nfl_player_params
    params.require(:nfl_player).permit(:name, :date_of_birth, :position, :height, :weight, :college, :draft, :experience, :image_path)
  end
end
