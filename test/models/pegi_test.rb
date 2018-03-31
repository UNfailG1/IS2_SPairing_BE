# == Schema Information
#
# Table name: pegis
#
#  id         :integer          not null, primary key
#  peg_name   :string
#  peg_age    :integer
#  peg_image  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PegiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
