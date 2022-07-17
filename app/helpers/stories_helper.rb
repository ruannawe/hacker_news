module StoriesHelper
  def format_link(link)
    URI.parse(link).host
  end
end
