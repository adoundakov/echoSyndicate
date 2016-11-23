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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
