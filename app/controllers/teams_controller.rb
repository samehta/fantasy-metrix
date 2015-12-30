class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = "Team was successfully saved."
      redirect_to @team
    else
      flash[:error] = "There was an error saving the team. Please try again."
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      flash[:notice] = "\"#{@team.name}\" was successfully deleted."
      redirect_to teams_path
    else
      flash[:error] = "There was an error deleting the team. Please try again."
      render :show
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
