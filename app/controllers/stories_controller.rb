require 'faraday'
require 'faraday/net_http'
Faraday.default_adapter = :net_http

class StoriesController < ApplicationController
  AMOUNT_OF_STORIES = 10

  def index
    response = Faraday.get('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty')
    story_ids = response.body.first(AMOUNT_OF_STORIES)
    story_ids.each do |story_id|
      story_data(story_id)
    end
  end

  private

  def story_data(story_id)
    response = Faraday.get("https://hacker-news.firebaseio.com/v0/item/#{story_id}.json?print=pretty")
    story = response.body
  end
end
