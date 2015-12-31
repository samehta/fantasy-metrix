class PlayersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @team = Team.find(params[:team_id])
    @player = @team.players.find(params[:id])
  end

  def new
    @team = Team.find(params[:team_id])
    @player = Player.new
  end

  def edit
    @team = Team.find(params[:team_id])
    @player = Player.find(params[:id])
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.new(player_params)
    @player.team = @team
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
    params.require(:player).permit(:name, :age, :college, :draft)
  end
end
