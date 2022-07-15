class HackerNewsService
  AMOUNT_OF_STORIES = 10

  def create(item_ids)
    return if item_ids.nil?

    item_ids.each do |item_id|
      response = Faraday.get("https://hacker-news.firebaseio.com/v0/item/#{item_id}.json?print=pretty")
      item_params, kids = parse_item_params(JSON.parse(response.body))

      begin
        Item.create!(item_params)
      rescue StandardError => e
        debugger
      end

      create(kids)
    end
  end

  def top_stories
    response = Faraday.get('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty')
    story_ids = JSON.parse(response.body).first(AMOUNT_OF_STORIES)
    create(story_ids)
  end

  private

  def parse_item_params(item_params)
    item = {
      id: item_params['id'],
      by: item_params['by'],
      item_type: item_params['type'],
      time: item_params['time'],
      item_id: item_params['parent'],
      title: item_params['title'],
      url: item_params['url'],
      score: item_params['score'],
      text: item_params['text'],
    }

    [item, item_params['kids']]
  end
end