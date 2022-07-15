class HackerNewsClient
  def initialize
    @hn_url = 'https://hacker-news.firebaseio.com/v0/'
  end

  def get_top_stories
    response = Faraday.get("#{@hn_url}topstories.json?print=pretty")
    JSON.parse(response.body)
  end

  def get_item(id)
    response = Faraday.get("#{@hn_url}item/#{id}.json?print=pretty")
    JSON.parse(response.body)
  end
end
