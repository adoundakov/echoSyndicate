# json.array! @articles.each do |article|
#   json.partial! 'api/articles/article', article: article
# end

json.array! @pairs.each do |pair|
  json.array! pair.each do |article|
    json.partial! 'api/articles/article', article: article
  end
end
