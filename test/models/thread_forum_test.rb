# == Schema Information
#
# Table name: thread_forums
#
#  id           :integer          not null, primary key
#  thr_name     :string
#  thr_views    :integer
#  thr_comments :integer
#  sub_forum_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_thread_forums_on_sub_forum_id  (sub_forum_id)
#

require 'test_helper'

class ThreadForumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
