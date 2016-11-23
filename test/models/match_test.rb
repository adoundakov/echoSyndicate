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

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
