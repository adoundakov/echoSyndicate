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
    matches = []
    Match.all.reverse.each do |match|
      # ensures that 'liberal' articles are @ first position
      articles = match.articles.sort_by(&:score)
      matches << articles unless already_included?(matches, articles)
    end

    matches
  end

  def self.already_included?(matches, articles)
    matches.any? do |pair|
      pair[0] == articles[0] || pair[1] == articles[1]
    end
  end

  def self.get_matched_articles(limit, num)
    matches = []
    Match.all.order(id: :desc).limit(limit).offset(num).each do |match|
      # ensures that 'liberal' articles are @ first position
      articles = match.articles.sort_by(&:score)
      matches << articles unless already_included?(matches, articles)
    end

    matches
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
