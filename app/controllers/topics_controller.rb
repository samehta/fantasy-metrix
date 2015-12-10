class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic was successfully saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attribtues(topic_params)
      flash[:notice] = "Topic was successfully updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error updating the topic. Please try again."
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end
end
