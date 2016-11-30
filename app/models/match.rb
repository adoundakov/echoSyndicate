# == Schema Information
#
# Table name: matches
#
#  id                :integer          not null, primary key
#  first_article_id  :integer          not null
#  second_article_id :integer          not null
#  score             :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Match < ApplicationRecord
  validates :first_article_id, :second_article_id, :score, presence: true
  validates :score, numericality: { greater_than: 2 }
  validate :not_already_matched

  belongs_to :first_article,
             primary_key: :id,
             foreign_key: :first_article_id,
             class_name: :Article

  belongs_to :second_article,
             primary_key: :id,
             foreign_key: :second_article_id,
             class_name: :Article

  def self.all_matched_articles
    matched_articles = []
    Match.all.each do |match|
      arts = match.articles
      matched_articles << arts.sort unless matched_articles.include?(arts.sort)
    end

    matched_articles
  end

  def self.get_matched_articles(limit, num)
    matched_articles = []
    Match.all.limit(limit).offset(num).each do |match|
      arts = match.articles
      matched_articles << arts.sort unless matched_articles.include?(arts.sort)
    end

    matched_articles
  end

  def not_already_matched
    if Match.exists?(["(first_article_id = ? AND second_article_id = ?) OR
                      (first_article_id = ? AND second_article_id = ?)",
                      self.first_article_id, self.second_article_id,
                      self.second_article_id, self.first_article_id])
      errors['Match'] << "already exists with this pair of articles"
    end
  end

  def articles
    Article.where("id = #{self.first_article_id} OR
                   id = #{self.second_article_id}")
  end
end
