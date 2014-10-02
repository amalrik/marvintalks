# == Schema Information
#
# Table name: forum_threads
#
#  id               :integer          not null, primary key
#  subject          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  parent_thread_id :integer
#
# Indexes
#
#  index_forum_threads_on_parent_thread_id  (parent_thread_id)
#

require 'test_helper'

class ForumThreadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
