class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_posts
  after_filter  :ensure_post_exists
  
  private
  
  def load_posts
    @posts = Post.order('created_at desc')
  end
  
  def ensure_post_exists
    @post ||= Post.new
  end
  
end
