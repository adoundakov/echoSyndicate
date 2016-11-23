class ApplicationJob < ActiveJob::Base
  def perform
    base_uri = 'http://newsapi.org/v1/articles?'
    Source.all.each do |src|
      resp = HTTParty.get(base_uri + "source=#{src.private_name}&apiKey=#{ENV['NEWS_KEY']}")
      next if resp['status'].nil? || resp['status'] == 'error' # in case News API blows up
      resp['articles'].each do |article|
        article['source_name'] = resp['source']
        article['article_url'] = resp['url']
        article['image_url'] = resp['urlToImage']
        Article.create(article)
      end
      puts "Created #{resp['articles'].size} articles for #{resp['source']}"
    end
  end
end
