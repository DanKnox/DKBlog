class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.create( params[:post] )
    @post.date = Time.now.to_date
    if @post.save
      flash[:notice] = "Post created"
      redirect_to content_index_path
    else
      flash[:alert] = "problem creating post"
      render "content#new"
    end
  end
  
  def show
    @post = Post.find( params[:id] )
  end  
  
  def edit
    @post = Post.find( params[:id] )
  end
  
  def update
    @post = Post.find( params[:id] )
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully."
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "Problem updating post."
      render :edit
    end
  end  

end
