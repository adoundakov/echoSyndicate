json.extract! article, :id, :title, :date, :author,
              :image_url, :article_url, :description
json.set! :source_name, article.source.public_name
