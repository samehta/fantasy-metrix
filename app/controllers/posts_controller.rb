class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @comments = @post.comments
    @comment = @post.comments.build
    authorize @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic
    authorize @post
    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error creating the post. Please try again."
      render :new
    end
  end  

  def update
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was successfully updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error updating the post. Please try again."
      render :edit
    end
  end

  private 

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
