class Match < ApplicationRecord
  validates :first_article_id, :second_article_id, :score, presence: true

  def articles
    Article.where("id = #{this.first_article_id} OR id = #{this.second_article_id}")
  end
end
