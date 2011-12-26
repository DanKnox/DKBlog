module MarkdownRenderer
  def markdown(text)
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true, :fenced_code_blocks => true, :gh_blockcode => true)
    renderer.render(text)
  end  
end
  