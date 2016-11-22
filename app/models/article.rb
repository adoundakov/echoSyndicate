class Article < ApplicationRecord
  @@exclusions = [ "about", "above", "across", "after", "against", "along", "amid", "among", "anti", "around", "as", "at", "before", "behind", "below", "beneath", "beside", "besides", "between", "beyond", "but", "by", "concerning", "considering", "despite", "down", "during", "except", "excepting", "excluding", "following", "for", "from", "in", "inside", "into", "like", "minus", "near", "of", "off", "on", "onto", "opposite", "outside", "over", "past", "per", "plus", "regarding", "round", "save", "since", "than", "through", "to", "toward", "towards", "under", "underneath", "unlike", "until", "up", "upon", "versus", "via", "with", "within", "without", "a", "an", "the", "this", "that", "these", "those", "each", "every", "either", "neither", "much", "enough", "which", "what", "his", "her", "their", "theirs"]

  validates :title, :source_name, :date, :author, :image_url, :article_url,
    :description, :keywords, presence: true

  before_validation :add_keywords

  belongs_to :source,
  primary_key: :private_name,
  foreign_key: :source_name,
  class_name: :Source

  def matches
    Match.where("first_article_id = #{self.id} OR second_article_id = #{self.id}")
  end

  private

  def add_keywords
    self.keywords = []
    title_arr = self.title.downcase.split(" ")
    title_arr.each do |el|
      if !@@exclusions.include(el)
        self.keywords.push(el)
      end
    end
  end
  self.keywords.uniq
end
