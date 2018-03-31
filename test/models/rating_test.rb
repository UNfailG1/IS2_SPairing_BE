# == Schema Information
#
# Table name: ratings
#
#  id             :integer          not null, primary key
#  rat_rater_id   :integer
#  rat_recever_id :integer
#  rat_rate       :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
