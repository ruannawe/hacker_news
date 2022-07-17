class HackerNewsService
  AMOUNT_OF_STORIES = 10

  def initialize
    @hn_client = HackerNewsClient.new
  end

  def top_stories
    new_stories = @hn_client.get_top_stories.first(AMOUNT_OF_STORIES)
    registered_stories = Item.where.not(id: new_stories).pluck(:id)
    new_stories -= registered_stories

    create(new_stories)
  end

  private

  def create(item_ids)
    return if item_ids.nil?

    item_ids.each do |item_id|
      item_params, kids = parse_item_params(@hn_client.get_item(item_id))

      Item.create!(item_params) if Item.item_types.keys.include?(item_params[:item_type])

      create(kids)
    end
  end

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