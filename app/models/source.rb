class Source < ApplicationRecord
  include HTTParty
  validates :private_name, :public_name, :score, presence: true

  has_many :articles,
  primary_key: :private_name,
  foreign_key: :source_name,
  class_name: :Article
end
