class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    comment.user = current_user
    authorize comment
    if comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error creating the comment. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    authorize comment
    if comment.destroy
      flash[:notice] = "Comment was successfully deleted."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
      redirect_to [post.topic, post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end