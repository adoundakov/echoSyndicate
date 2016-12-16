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
  validate :not_already_matched, :not_too_many_matches

  belongs_to :first_article,
             primary_key: :id,
             foreign_key: :first_article_id,
             class_name: :Article

  belongs_to :second_article,
             primary_key: :id,
             foreign_key: :second_article_id,
             class_name: :Article

  def self.generate_histogram
    # wasteful, needs to be adapted so this isnt run every time a match is made
    # can be done as a lazy assignment ||= plus lifecycle methods
    # also done in controller?
    articles = Match.all.map { |m| m.articles }.flatten
    kwds = articles.map(&:keywords).flatten
    hist = Hash.new(0)
    kwds.each { |word| hist[word] += 1 }
    hist
  end

  def self.already_included?(matches, articles)
    matches.any? do |pair|
      pair[0] == articles[0] || pair[1] == articles[1]
    end
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

  def not_too_many_matches
    if self.articles.any? { |art| art.matches.size >= 2 }
      errors.add(:article, ("has been matched too many times"))
    end
  end

  def articles
    Article.where("id = #{self.first_article_id} OR
                   id = #{self.second_article_id}")
  end
end
