class HackerNewsJob
  include Sidekiq::Job

  def perform(*args)
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    HackerNewsService.new.top_stories
  end
end
