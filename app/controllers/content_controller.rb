class ContentController < ApplicationController
  def index
    @content = Post.last
  end  
end
