class NflTeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @nfl_teams = NflTeam.all
    authorize @nfl_teams
  end

  def show
    @nfl_team = NflTeam.friendly.find(params[:id])
    @nfl_players = @nfl_team.nfl_players
    authorize @nfl_team
  end

  def new
    @nfl_team = NflTeam.new
    authorize @nfl_team
  end

  def edit
    @nfl_team = NflTeam.friendly.find(params[:id])
    authorize @nfl_team
  end

  def create
    @nfl_team = NflTeam.new(nfl_team_params)
    authorize @nfl_team
    if @nfl_team.save
      flash[:notice] = "The #{@nfl_team.name} was successfully created."
      redirect_to @nfl_team
    else
      flash[:error] = "There was an error creating the NFL team. Please try again."
      render :new
    end
  end

  def update
    @nfl_team = NflTeam.friendly.find(params[:id])
    authorize @nfl_team
    if @nfl_team.update_attributes(nfl_team_params)
      flash[:notice] = "The #{@nfl_team.name} was succesffully updated."
      redirect_to @nfl_team
    else
      flash[:error] = "There was an error updating the #{@nfl_team.name}. Please try again."
      render :edit
    end
  end

  def destroy
    @nfl_team = NflTeam.friendly.find(params[:id])
    authorize @nfl_team
    if @nfl_team.destroy
      flash[:notice] = "The NFL team was successfully deleted."
      redirect_to nfl_teams_path
    else
      flash[:error] = "There was an error deleting the NFL team. Please try again."
      render :show
    end
  end

  private

  def nfl_team_params
    params.require(:nfl_team).permit(:name, :abbreviation, :image_path)
  end
end
