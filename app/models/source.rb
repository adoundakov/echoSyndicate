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
#

class Source < ApplicationRecord
  validates :private_name, :public_name, :score, presence: true

  has_many :articles,
           primary_key: :private_name,
           foreign_key: :source_name,
           class_name: :Article
end
