class ContentController < ApplicationController
  def index
    @post = Post.last
  end  
end
