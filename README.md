![header](/docs/screenshots/header.png)

#### [Echo Syndicate live](www.echosyndicate.com)

## Description

Recently, there [has been](intro link 1) a [lot of](intro link 2) talk about echo chambers and the role that they play in our society. An [echo chamber](wiki def) is essentially when information or ideas are reinforced by transmission and repetition in an enclosed system.

echoSyndicate was created to solve this problem by making the alternative viewpoint available, breaking the echo chamber. echoSyndicate uses an algorithm to dynamically match articles about the same subject, but from differing news sources, and juxtaposes them on the same web page. This ensures that a reader gets both sides of the story, and breaks through the echo chamber.

![landing page](docs/screenshots/landing_page.png)

[intro link 1]: https://www.wired.com/2016/06/facebook-embraces-news-feed-echo-chamber/
[intro link 2]: https://www.wired.com/2016/11/filter-bubble-destroying-democracy/
[wiki def]: https://en.wikipedia.org/wiki/Echo_chamber_(media)

## Features

### Articles

At a high-level, Echo Syndicate works by taking in raw articles from the Internet, analyzing them using algorithms, and displays them with an alternating color scheme on an infinitely-scrolling page. Clicking on an article takes you to the respective publication's website.


#### Importing New Articles

ES sources its articles from [NewsAPI](www.newsapi.org). We automated the import and analysis process by using a `rake task` set to run every hour. This task pulls the top articles for each source, checks to see if the article already exists in the database, and creates a database entry for each article.

```Ruby
# in /lib/tasks/scheduler.rake
desc "This task updates news articles in Database"
task :update_articles => :environment do
  puts "Updating articles..."
  Article.update
  puts "done."
end

# in /app/models/article.rb
# in the Article Class
def self.update
  base_uri = 'http://newsapi.org/v1/articles?'
  key = "&apiKey=#{ENV['NEWS_KEY']}"
  Source.all.each do |src|
    resp = HTTParty.get(base_uri + "source=#{src.private_name}" + key)

    # in case News API blows up
    next unless resp['status'] == 'ok'

    resp['articles'].each { |article| process_article(resp, article) }
    puts "Created #{resp['articles'].size} articles for #{resp['source']}"
  end

  # drop articles older than a week
  delete_expired_articles
end

def self.process_article(response, article)
  # needed to pass validations, mate API response structure to DB schema
  article['source_name'] = response['source']
  article['article_url'] = article['url']
  article['image_url'] = article['urlToImage']
  article['date'] = article['publishedAt']

  article.except!('url', 'urlToImage', 'publishedAt')
  Article.create(article)
end

def self.delete_expired_articles
  Article.where("date < ?", Time.now - 7.days).each(&:destroy)
end
```

The automation for this process is achieved in two different ways:
  - Running a local server, we use the [Crono](www.github.com) gem and an `ApplicationJob` to run `Article.update` every 60 minutes.
  - On Heroku, we use the `Heroku Scheduler` add-on to execute `rake update_articles` every 60 minutes.

> Read more about HTTParty [here](www.github.com)

#### Algorithms and Political Leaning

Echo Syndicate uses NLP to compute the space-time complexity of each article, and the gravitational pull that each article exerts on the HTML5 elements nearest to it, in addition to each author's Zodiac sign to determine politial leaning.

**Obviously coming soon**

#### Our Team

[Alex Doundakov](www.github.com/adoundakov)

![prof-pic](http://placehold.it/100x100)

[Mike Barile](www.github.com/mikebarile)

![prof-pic](http://placehold.it/100x100)

[Ethan Kong Wan](www.github.com/ethankong113)

![prof-pic](http://placehold.it/100x100)

#### Feedback

Have feedback for he Echo Syndicate team? Drop us an email at echo-syndicate@mailinator.com!
