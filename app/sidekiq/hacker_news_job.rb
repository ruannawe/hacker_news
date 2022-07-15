require 'sidekiq-scheduler'

class HackerNewsJob
  include Sidekiq::Job

  def perform(*args)
    # HackerNewsService.new.top_stories
    puts 'test'
  end
end
