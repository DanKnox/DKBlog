class Post < ActiveRecord::Base
  include MarkdownRenderer
  
  def body
    markdown(self[:body])
  end
  
end
