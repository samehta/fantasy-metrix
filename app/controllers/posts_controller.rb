class PostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic
    if @post.save
      flash[:notice] = "Post was successfully saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end  

  def update
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.find(params[:id])
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
