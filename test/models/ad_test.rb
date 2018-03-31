# == Schema Information
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  ad_description :text
#  ad_link        :string
#  ad_image       :string
#  sponsor_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_ads_on_sponsor_id  (sponsor_id)
#

require 'test_helper'

class AdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
