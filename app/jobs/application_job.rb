class ApplicationJob < ActiveJob::Base
  def perform
    base_uri = 'http://newsapi.org/v1/articles?'
    key = "&apiKey=#{ENV['NEWS_KEY']}"
    Source.all.each do |src|
      article_source = "source=#{src.private_name}"
      resp = HTTParty.get(base_uri + article_source + key)

      # in case News API blows up
      next if resp['status'].nil? || resp['status'] == 'error'
      resp['articles'].each do |article|
        article['source_name'] = resp['source']
        article['article_url'] = article['url']
        article['image_url'] = article['urlToImage']
        article['date'] = article['publishedAt']

        # needed to pass validations, mate API response to DB schema
        article.except!('url', 'urlToImage', 'publishedAt')
        Article.create(article)
      end
      puts "Created #{resp['articles'].size} articles for #{resp['source']}"
    end

    # drop articles older than 48 hours
    Article.where("date < ?", Time.now - 2.days).each(&:destroy)
  end
end
