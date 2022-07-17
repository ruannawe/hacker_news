class HackerNewsJob
  include Sidekiq::Job

  def perform(*args)
    HackerNewsService.new.top_stories
  end
end
