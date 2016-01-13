class PlayersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
    @passing_game_logs = @player.passing_game_logs 
    @passing_game_log = PassingGameLog.new
    authorize @player
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
    authorize @player
  end

  def edit
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
    authorize @player
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.new(player_params)
    @player.team = @team
    authorize @player
    if @player.save
      flash[:notice] = "#{@player.name} was successfully created."
      redirect_to [@team, @player]
    else
      flash[:error] = "There was an error creating the player. Please try again."
      render :new
    end
  end

  def update
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
    authorize @player
    if @player.update_attributes(player_params)
      flash[:notice] = "#{@player.name} was successfully updated."
      redirect_to [@team, @player]
    else
      flash[:error] = "There was an error updating #{@player.name}. Please try again."
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
    authorize @player
    if @player.destroy
      flash[:notice] = "#{@player.name} was successfully deleted."
      redirect_to @team
    else
      flash[:error] = "There was an error deleting #{@player.name}. Please try again."
      render :show
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :date_of_birth, :position, :height, :weight, :college, :draft, :experience, :image_path)
  end
end
