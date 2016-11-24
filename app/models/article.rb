# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  source_name :string           not null
#  date        :date             not null
#  author      :string           not null
#  image_url   :string           not null
#  article_url :string           not null
#  description :text             not null
#  keywords    :text             default([]), is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  score       :float            not null
#

class Article < ApplicationRecord
  @@exclusions = [ "about", "above", "across", "after", "against", "along",
                   "amid", "among", "anti", "around", "as", "at", "before",
                   "behind", "below", "beneath", "beside", "besides", "between",
                   "beyond", "but", "by", "concerning", "considering",
                   "despite", "down", "during", "except", "excepting",
                   "excluding", "following", "for", "from", "in", "inside",
                   "into", "like", "minus", "near", "of", "off", "on", "onto",
                   "opposite", "outside", "over", "past", "per", "plus",
                   "regarding", "round", "save", "since", "than", "through",
                   "to", "toward", "towards", "under", "underneath", "unlike",
                   "until", "up", "upon", "versus", "via", "with", "within",
                   "without", "a", "an", "the", "this", "that", "these",
                   "those", "each", "every", "either", "neither", "much",
                   "enough", "which", "what", "his", "her", "their", "theirs"]

  validates :title, :source_name, :date, :author, :image_url, :article_url,
            :description, :keywords, presence: true

  validate :duplicate_article?

  before_validation :add_keywords, :determine_leaning

  after_create :initiate_matches

  belongs_to :source,
             primary_key: :private_name,
             foreign_key: :source_name,
             class_name: :Source

  def duplicate_article?
    if Article.exists?(title: self.title, source_name: self.source_name)
      errors[:article] << 'already exists in database'
    end
  end

  def matches
    Match.where("first_article_id = #{self.id} OR
                second_article_id = #{self.id}")
  end

  protected

  def generate_matches(articles)
    articles.each do |article|
      match_score = 0
      self.keywords.each do |keyword|
        match_score += 1 if article.keywords.include?(keyword)
      end
      Match.create(first_article_id: self.id,
                   second_article_id: article.id,
                   score: match_score)
    end
  end

  private

  def add_keywords
    self.keywords = []
    title_arr = self.title.downcase.split(" ")
    title_arr.each do |el|
      self.keywords.push(el) unless @@exclusions.include?(el)
    end
    self.keywords = self.keywords.uniq
  end

  def determine_leaning
    self.score = self.source.score
  end

  def initiate_matches
    articles = Article.includes(:source).where("
      1=1
      AND id != #{self.id}
      AND date >= '#{self.date}'::date - '2 days'::interval
      AND (score / @ score) != (#{self.score} / @ #{self.score})")
    self.generate_matches(articles)
  end

end
