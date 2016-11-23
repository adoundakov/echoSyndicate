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

  def articles
    Article.where("id = #{this.first_article_id} OR id = #{this.second_article_id}")
  end
end
