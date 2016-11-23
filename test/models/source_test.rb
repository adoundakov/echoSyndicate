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

require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
