json.array! @articles.each do |article|
  json.partial! 'api/articles/article', article: article
end
