class CommentsController < ApplicationController
  
  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    @comment.user = signed_in? ? current_user : nil
    if @comment.save
      flash[:notice] = "Comment created successfully."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Problem creating comment."
      redirect_to post_path(@post)
    end
  end
  
end