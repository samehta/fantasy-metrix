class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @teams = Team.all
    authorize @teams
  end

  def show
    @team = Team.find(params[:id])
    @players = @team.players
    authorize @team
  end

  def new
    @team = Team.new
    authorize @team
  end

  def edit
    @team = Team.find(params[:id])
    authorize @team
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    if @team.save
      flash[:notice] = "#{@team.name} was successfully created."
      redirect_to @team
    else
      flash[:error] = "There was an error creating the team. Please try again."
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])
    authorize @team
    if @team.update_attributes(team_params)
      flash[:notice] = "#{@team.name} was succesffully updated."
      redirect_to @team
    else
      flash[:error] = "There was an error updating the team. Please try again."
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    authorize @team
    if @team.destroy
      flash[:notice] = "Team was successfully deleted."
      redirect_to teams_path
    else
      flash[:error] = "There was an error deleting the team. Please try again."
      render :show
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :image_path)
  end
end
