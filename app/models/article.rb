class Article < ApplicationRecord
  validates :title, :source_name, :date, :author, :image_url, :article_url,
    :description, :keywords, presence: true

  def matches
    Match.where("first_article_id = #{self.id} OR second_article_id = #{self.id}")
  end

  belongs_to :source,
  primary_key: :private_name,
  foreign_key: :source_name,
  class_name: :Source
end
