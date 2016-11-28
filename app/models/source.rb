# == Schema Information
#
# Table name: sources
#
#  id           :integer          not null, primary key
#  private_name :string           not null
#  public_name  :string           not null
#  score        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  logo_url     :string           not null
#

class Source < ApplicationRecord

  validates :private_name,
            :public_name,
            :score,
            :logo_url,
            presence: true

  before_validation :generate_logo_url

  has_many :articles,
           primary_key: :private_name,
           foreign_key: :source_name,
           class_name: :Article

  def generate_logo_url
    self[:logo_url] = "http://i.newsapi.org/#{private_name}-l.png"
  end
end
