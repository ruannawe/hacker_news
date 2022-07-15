class HackerNewsService
  AMOUNT_OF_STORIES = 10

  def initialize
    @hn_client = HackerNewsClient.new
  end

  def top_stories
    story_ids = @hn_client.get_top_stories.first(AMOUNT_OF_STORIES)
    create(Item.where.not(id: story_ids).pluck(:id))
  end

  private

  def create(item_ids)
    return if item_ids.nil?

    item_ids.each do |item_id|
      item_params, kids = parse_item_params(@hn_client.get_item(item_id))

      if Item.item_types.keys.include?(item_params[:item_type])
        Item.create!(item_params) if Item.find_by(id: item_params[:id]).nil?
      end

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