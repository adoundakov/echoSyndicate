Source.create!(private_name: "cnn-news", public_name: "CNN", score: -3)
Source.create!(private_name: "fox-news", public_name: "Fox", score: 3)
Article.create!(
  title: "Trump is an asshole!",
  source_name: "cnn-news",
  date: "2016-11-22",
  author: "Mike Barile",
  image_url: "www.google.com",
  article_url: "www.cnn.com",
  description: "Mike Barile expounds on why he thinks Trump is an asshole",
)
Article.create!(
  title: "Trump is great!",
  source_name: "fox-news",
  date: "2016-11-22",
  author: "Ethan Wan",
  image_url: "www.google.com",
  article_url: "www.foxnews.com",
  description: "Ethan Wan expounds on why he thinks Trump is making America great again",
)
Match.create!(first_article_id: 1, second_article_id: 2, score: 5)
