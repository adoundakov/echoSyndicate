![header](/docs/screenshots/header.png)

#### [Echo Syndicate live](www.echosyndicate.com)

## Description

Recently, there [has been](intro link 1) a [lot of](intro link 2) talk about echo chambers and the role that they play in our society. An [echo chamber](wiki def) is essentially when information or ideas are reinforced by transmission and repetition in an enclosed system.

Echo Syndicate was created to solve this problem by making the alternative viewpoint available, breaking the echo chamber. Echo Syndicate uses an algorithm to dynamically match articles about the same subject, but from differing news sources, and juxtaposes them on the same web page. This ensures that a reader gets both sides of the story, and breaks through the echo chamber.

![landing page](docs/screenshots/landing_page.png)

[intro link 1]: https://www.wired.com/2016/06/facebook-embraces-news-feed-echo-chamber/
[intro link 2]: https://www.wired.com/2016/11/filter-bubble-destroying-democracy/
[wiki def]: https://en.wikipedia.org/wiki/Echo_chamber_(media)

### Articles

At a high-level, Echo Syndicate works by taking in raw articles from the Internet, analyzing them using algorithms, and displays them with an alternating color scheme on an infinitely-scrolling page. Clicking on an article takes you to the respective publication's website.


#### Importing New Articles

ES sources its articles from [NewsAPI](www.newsapi.org). We automated the import and analysis process by using a `rake task` set to run every hour. This task uses [HTTParty](https://github.com/jnunemaker/httparty) to pull the top articles for each source, checks to see if the article already exists in the database, and creates a database entry for each article.

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
  - Running a local server, we use the [Crono](www.github.com/plashchynski/crono) gem and an `ApplicationJob` to run `Article.update` every 60 minutes.
  - On Heroku, we use the `Heroku Scheduler` add-on to execute `rake update_articles` every 60 minutes.

#### Algorithms and Political Leaning

**Coming Soon**

#### Displaying Articles

Echo Syndicate utilizes React.js, implementing the Redux design pattern to provide smooth performance. The frontend makes use of an AJAX request to pull matched articles from the Rails API. The Rails server receives this request, instantiates the `ArticlesController` and uses jBuilder to generate an appropriate response as a JSON.

![json screenshot](/docs/screenshots/json.png)

Each article pair is then rendered as a React Component, with styling appropriate to the bias of each respective article.

![article pair](/docs/screenshots/article_match.png)

### Future Directions for Echo Syndicate

  - Filters:
    - Users of the site should be able to either search for a title by name or have a category filter to see news stories only about Politics, Technology, Business, etc.
  - More news sources:
    - We would like to use hand-rolled web scrapers to add support for those news sources that do not have public APIs (Rush Limbaugh, Sean Hannity, Vox, Slate, etc.).
  - Better Matching
    - Further refine the NLP algorithm to better determine the political leaning of an article.


### Our Team

| [Alex Doundakov](www.adoundakov.github.io) | [Mike Barile](wwww.mikebarile.com) | [Ethan Kong Wan](www.github.com/ethankong113)|
|:-------------------------------------------:|:-----------:|:--------------:|
|![prof-pic](http://res.cloudinary.com/adoundakov/image/upload/c_fill,g_face,h_100,w_100/v1479759643/Doundakov_jee5lx.jpg)|![prof-pic](http://res.cloudinary.com/adoundakov/image/upload/c_fill,g_face,w_100/v1480531078/mikeProf_twomwt.jpg)|      ![prof-pic](http://res.cloudinary.com/adoundakov/image/upload/c_fill,g_face,h_100,w_100/v1480531078/ethanProf_uznhzz.jpg)|

#### Feedback

Have feedback for the Echo Syndicate team? Drop us an email at echo-syndicate@mailinator.com!
