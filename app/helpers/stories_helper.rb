module StoriesHelper
  def format_link(link)
    URI.parse(link).host
  end

  def count_comments(items, amount = 0)
    return amount if items.empty?

    items.each do |item|
      amount += 1
      amount = count_comments(item.items, amount)
    end

    amount
  end
end
