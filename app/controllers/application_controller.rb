class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_posts
  
  private
  
  def load_posts
    @posts = Post.order('created_at desc')
  end
  
end
